# HealthPal

A Healthcare and Wellness FAQ chatbot that combines MeTTa knowledge graphs with Google's Gemini 2.0 LLM for enhanced, context-aware responses. Features multimodal capabilities, automatic knowledge extraction, and rich interactive responses.

## 🌟 Features

- **Knowledge Graph Integration**: Uses MeTTa for structured knowledge representation
- **LLM Integration**: Leverages Google Gemini 2.0 for natural language understanding
- **Graph RAG**: Retrieval-Augmented Generation for context-aware responses
- **Real-time Updates**: Support for adding new FAQs, entities, and relationships
- **Context-Aware Answers**: Understands relationships and hierarchies within the domain
- **Rich Responses**: Provides text, images, links, and interactive elements
- **Automatic Knowledge Extraction**: Extract entities, relationships, and FAQs from text and images

## 🚀 Quick Start

### Option 1: Using the Start Script (Recommended for Unix/Mac)

```bash
# Make the script executable (if not already)
chmod +x start.sh

# Run the start script
./start.sh
```

The script will:
1. Create a virtual environment if it doesn't exist
2. Install all dependencies
3. Check for a `.env` file with your Gemini API key
4. Start the server

### Option 2: Using the Demo Script (Recommended for All Platforms)

```bash
# Activate your virtual environment first
# On Unix/Mac:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate

# Run the demo script
python start_demo.py
```

This script will:
1. Start the server
2. Open the demo interface in your default web browser
3. Handle server shutdown when you're done

### Prerequisites

- Python 3.9+
- Gemini API key from [Google AI Studio](https://ai.google.dev/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Betty987/FAQ-chatbot.git
   cd FAQ-chatbot
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Create a `.env` file with your Gemini API key:
   ```bash
   echo "GEMINI_API_KEY=your_api_key_here" > .env
   ```

### Running the Project

1. Start the server:
   ```bash
   python src/main.py
   ```

2. Access the demo interface:
   - Navigate to `http://localhost:8000/demo.html` in your browser
   
   > **Important**: Always access the demo through the server at `http://localhost:8000/demo.html`. Opening the HTML file directly will not work as it needs to connect to the server API.

## 🧠 Using the Chatbot

### Interactive Demo Interface

The demo interface (`demo.html`) provides a complete experience:

1. **Chat Interface**: Ask questions and get rich, formatted responses
2. **Knowledge Graph Visualization**: See the knowledge graph grow in real-time
3. **Knowledge Management**: Add new FAQs, entities, and relationships
4. **Knowledge Extraction**: Extract knowledge from text and images

To use the demo:
1. Start the server using one of the methods above
2. Open `http://localhost:8000/demo.html` in your browser
3. Type questions in the chat input or upload images
4. View the knowledge graph visualization to see connections


#### Chat Endpoints

1. **Text-only Chat**
```http
POST /chat
Content-Type: application/json

{
    "text": "What is a knowledge graph?",
    "history": [{"user": "Previous question", "assistant": "Previous answer"}]
}
```

2. **Multimodal Chat (Text + Images)**
```http
POST /chat/multimodal
Content-Type: multipart/form-data

text: What is in this image?
files: [image.jpg]
history: [{"user": "Previous question", "assistant": "Previous answer"}]
```

#### Knowledge Management Endpoints

1. **Add FAQ**
```http
POST /faq
Content-Type: application/json

{
    "question": "What is a knowledge graph?",
    "answer": "A knowledge graph is a network of entities, their semantic types, properties, and relationships between entities.",
    "category": "Knowledge Representation",
    "concepts": "knowledge graph semantic network ontology"
}
```



## 📁 Project Structure

```
domain-specific-faq-chatbot/
├── src/
│   ├── main.py                 # FastAPI server and API endpoints
│   ├── chat/
│   │   ├── llm.py              # Gemini LLM integration
│   │   ├── rag.py              # Graph RAG implementation
│   └── knowledge_graph/
│       ├── schema.metta        # MeTTa schema definition
│       └── data.metta          # Knowledge graph data
├── static/                     # Static assets (CSS, JS, images)
├── demo.html                   # Interactive demo interface
├── start_demo.py               # Script to start demo and open browser
├── start.sh                    # Unix/Mac startup script
├── requirements.txt            # Python dependencies
└── .env                        # Environment variables (create this)
```

