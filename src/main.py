import os
import json
from typing import List, Dict, Optional, Any
from fastapi import FastAPI, HTTPException, UploadFile, File, Form, BackgroundTasks
from fastapi.responses import JSONResponse, FileResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from dotenv import load_dotenv
from chat.llm import GeminiLLM
from chat.rag import GraphRAG
import logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Load environment variables
load_dotenv()

# Initialize FastAPI app
app = FastAPI(
    title="Domain-Specific FAQ Chatbot",
    description="A chatbot that combines knowledge graphs with LLM for enhanced FAQ responses",
    version="1.0.0"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

# Initialize components
llm = GeminiLLM()
rag = GraphRAG()


# Load knowledge base
@app.on_event("startup")
async def startup_event():
    """Load knowledge base on startup."""
    try:
        rag.load_knowledge_base(
            "src/knowledge_graph/schema.metta",
            "src/knowledge_graph/data.metta"
        )
    except Exception as e:
        print(f"Error loading knowledge base: {e}")

# Serve demo.html at the root
@app.get("/")
async def get_demo():
    return FileResponse("demo.html")

@app.get("/demo.html")
async def get_demo_html():
    return FileResponse("demo.html")

# Pydantic models for request/response validation
class Question(BaseModel):
    text: str
    history: Optional[List[Dict[str, str]]] = None

class Answer(BaseModel):
    text: str
    context: List[Dict]

class FAQEntry(BaseModel):
    question: str
    answer: str
    category: str
    concepts: Optional[str] = None

# class PropertyValue(BaseModel):
#     value: str
#     metadata: str

# class Entity(BaseModel):
#     name: str
#     entity_type: str
#     properties: Optional[Dict[str, PropertyValue]] = None

# class Relationship(BaseModel):
#     from_entity: str
#     relationship_type: str
#     to_entity: str
#     context: Optional[str] = ""

# class DocumentExtraction(BaseModel):
#     text: str

@app.post("/chat", response_model=Answer)
async def chat(question: Question):
    """
    Get an answer to a question using the knowledge graph and LLM.
    """
    try:
        # Query knowledge graph for context
        context = rag.query_context(question.text)
        
        # Generate response using LLM with context
        response = await llm.generate_response(
            question=question.text,
            context=context,
            history=question.history
        )
        
        return Answer(text=response, context=context)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/chat/multimodal")
async def chat_multimodal(
    text: str = Form(...),
    files: List[UploadFile] = File(None),
    history: str = Form(None)
):
    try:
        history_list = json.loads(history) if history else []
        media_files = []
        
        if files and any(file for file in files if file):
            logger.debug(f"Received {len(files)} files")
            for file in files:
                if not file or not file.content_type.startswith('image/'):
                    logger.debug(f"Skipping file: {file.filename if file else 'None'} (not an image)")
                    continue
                file_data = await file.read()
                logger.debug(f"Read file {file.filename}: {len(file_data)} bytes, MIME={file.content_type}")
                media_files.append({
                    'type': 'image',
                    'data': file_data,
                    'mime_type': file.content_type
                })
        
        context = rag.query_context(text)
        logger.debug(f"Context retrieved: {len(context)} items")
        
        response = await llm.generate_response(
            question=text,
            context=context,
            history=history_list,
            media_files=media_files
        )
        
        history_list.append({
            "user": text,
            "assistant": response
        })
        
        logger.debug("Response generated successfully")
        return JSONResponse(content={
            "text": response,
            "context": context,
            "history": history_list,
            "extracted_entities": []
        })
    except Exception as e:
        logger.error(f"Multimodal chat error: {str(e)}")
        return JSONResponse(
            status_code=400,
            content={"error": {"code": 400, "message": str(e), "status": "INVALID_ARGUMENT"}}
        )

# ... (rest of the file remains unchanged) ...

@app.post("/faq")
async def add_faq(faq: FAQEntry):
    """Add a new FAQ entry to the knowledge graph."""
    try:
        concepts_list = faq.concepts.split() if faq.concepts else None
        rag.add_faq(faq.question, faq.answer, faq.category, concepts_list)
        return {"message": "FAQ added successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))



async def add_extracted_data_to_graph(data: Dict[str, Any]):
    """
    Add extracted data to the knowledge graph.
    
    Args:
        data: Dictionary containing entities, relationships, and FAQ entries
    """
    
    # Add FAQ entries
    for faq in data.get('faq_entries', []):
        try:
            concepts = faq.get('concepts', '').split() if 'concepts' in faq else None
            rag.add_faq(
                question=faq['question'],
                answer=faq['answer'],
                category=faq.get('category', 'General'),
                concepts=concepts
            )
        except Exception as e:
            print(f"Error adding FAQ: {e}")

if __name__ == "__main__":
    import uvicorn
    
    # Mount static files after all routes are defined
    app.mount("/static", StaticFiles(directory="static"), name="static")
    
    uvicorn.run(app, host="0.0.0.0", port=8000) 