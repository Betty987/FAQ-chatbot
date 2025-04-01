;; Sample FAQ entries with related concepts
(FAQ "What is mental health?"
     "Mental health refers to a person’s emotional, psychological, and social well-being. It affects how individuals think, feel, and act, and influences how they handle stress, relate to others, and make choices."
     "Basics"
     "mental_wellness emotional_health psychology well_being")

(FAQ "How can therapy help with mental health?"
     "Therapy helps by providing a safe space to explore emotions, develop coping strategies, and address mental health conditions like anxiety or depression through techniques such as cognitive-behavioral therapy (CBT) or talk therapy."
     "Therapy"
     "therapy mental_health coping_strategies emotional_support")

(FAQ "What is cognitive-behavioral therapy (CBT)?"
     "Cognitive-behavioral therapy (CBT) is a type of psychotherapy that helps individuals identify and change negative thought patterns and behaviors to improve emotional regulation and mental health."
     "Therapy"
     "cbt psychotherapy mental_health cognitive_therapy")

(FAQ "Can I add new health information to the chatbot?"
     "Yes, you can add new FAQs, health conditions, or therapy techniques through the API endpoints. The knowledge graph updates in real-time to include this information."
     "Usage"
     "api knowledge_management real_time_updates health_data")

(FAQ "What is anxiety?"
     "Anxiety is a mental health condition characterized by excessive worry, fear, or nervousness. It can manifest physically (e.g., rapid heartbeat) and emotionally (e.g., restlessness) and may require therapy or medication."
     "MentalHealth"
     "anxiety mental_health symptoms treatment")

(FAQ "How does meditation benefit mental health?"
     "Meditation benefits mental health by reducing stress, improving focus, and promoting emotional balance. It activates relaxation responses in the brain and can be a complementary therapy for anxiety or depression."
     "Therapy"
     "meditation mental_health stress_reduction mindfulness")

(FAQ "What is depression?"
     "Depression is a common mental health disorder marked by persistent sadness, loss of interest, and low energy. It can be treated with therapy, medication, or lifestyle changes."
     "MentalHealth"
     "depression mental_health symptoms treatment")

(FAQ "How can I recognize stress symptoms?"
     "Stress symptoms include physical signs (e.g., headaches, fatigue), emotional signs (e.g., irritability), and behavioral changes (e.g., sleep issues). Chronic stress may require medical or therapeutic intervention."
     "MentalHealth"
     "stress symptoms health_management")

(FAQ "What is mindfulness?"
     "Mindfulness is a practice of staying present and fully engaged in the current moment, often used in therapy to reduce stress and improve mental clarity. It’s closely related to meditation."
     "Therapy"
     "mindfulness mental_health stress_reduction focus")

(FAQ "How can I improve my sleep for better mental health?"
     "Improving sleep involves establishing a routine, avoiding screens before bed, and managing stress. Good sleep enhances mood, reduces anxiety, and supports overall mental health."
     "MentalHealth"
     "sleep mental_health stress_management wellness")

(FAQ "What is talk therapy?"
     "Talk therapy, or psychotherapy, involves discussing emotions and experiences with a trained therapist to address mental health issues, build coping skills, and improve well-being."
     "Therapy"
     "talk_therapy psychotherapy mental_health emotional_support")

(FAQ "Can exercise help with mental health?"
     "Yes, exercise boosts mental health by releasing endorphins, reducing stress, and improving mood. It’s often recommended alongside therapy for conditions like depression and anxiety."
     "Therapy"
     "exercise mental_health stress_reduction endorphins")

(FAQ "What are panic attacks?"
     "Panic attacks are sudden episodes of intense fear or discomfort, often with physical symptoms like chest pain or shortness of breath. They’re linked to anxiety and can be managed with therapy or breathing techniques."
     "MentalHealth"
     "panic_attacks anxiety symptoms treatment")

(FAQ "How do I know if I need therapy?"
     "You might need therapy if you feel overwhelmed, experience persistent sadness, anxiety, or have trouble coping with daily life. A professional can assess your needs."
     "MentalHealth"
     "therapy mental_health self_assessment support")

(FAQ "What is bipolar disorder?"
     "Bipolar disorder is a mental health condition characterized by extreme mood swings, including manic highs and depressive lows. It’s managed with medication and therapy."
     "MentalHealth"
     "bipolar_disorder mental_health symptoms treatment")

(FAQ "How can I support someone with depression?"
     "Support someone with depression by listening without judgment, encouraging professional help, and offering practical assistance like helping with daily tasks."
     "MentalHealth"
     "depression support mental_health caregiving")

;; Sample entities with metadata
(Entity "MentalHealth" "Concept")
(Property "MentalHealth" "definition"
         "State of emotional and psychological well-being"
         "source: WHO confidence: 0.95")
(Property "MentalHealth" "importance"
         "Affects daily functioning and quality of life"
         "source: medical_literature confidence: 0.9")

(Entity "Therapy" "Concept")
(Property "Therapy" "definition"
         "Treatment to improve mental or physical health"
         "source: medical_dictionary confidence: 0.95")
(Property "Therapy" "types"
         "CBT, talk therapy, physical therapy"
         "source: healthcare_guidelines confidence: 0.9")

(Entity "CBT" "TherapyType")
(Property "CBT" "full_name"
         "Cognitive-Behavioral Therapy"
         "source: psychology_text confidence: 0.95")
(Property "CBT" "purpose"
         "Modify negative thoughts and behaviors"
         "source: clinical_studies confidence: 0.9")
(Property "CBT" "effectiveness"
         "High for anxiety and depression"
         "source: research_papers confidence: 0.85")

(Entity "Anxiety" "Condition")
(Property "Anxiety" "definition"
         "Excessive worry or fear affecting daily life"
         "source: DSM-5 confidence: 0.95")
(Property "Anxiety" "symptoms"
         "Restlessness, rapid heartbeat, sweating"
         "source: medical_literature confidence: 0.9")
(Property "Anxiety" "treatment"
         "Therapy, medication, relaxation techniques"
         "source: healthcare_guidelines confidence: 0.85")

(Entity "Depression" "Condition")
(Property "Depression" "definition"
         "Persistent sadness and loss of interest"
         "source: DSM-5 confidence: 0.95")
(Property "Depression" "symptoms"
         "Fatigue, hopelessness, sleep disturbances"
         "source: medical_literature confidence: 0.9")
(Property "Depression" "treatment"
         "Antidepressants, therapy, lifestyle changes"
         "source: clinical_guidelines confidence: 0.9")

(Entity "Meditation" "Technique")
(Property "Meditation" "definition"
         "Practice of focused attention for relaxation"
         "source: wellness_studies confidence: 0.9")
(Property "Meditation" "benefits"
         "Reduces stress, improves focus"
         "source: research_papers confidence: 0.85")

(Entity "Stress" "Condition")
(Property "Stress" "definition"
         "Body’s response to physical or emotional pressure"
         "source: medical_literature confidence: 0.95")
(Property "Stress" "symptoms"
         "Headaches, irritability, sleep problems"
         "source: health_guides confidence: 0.9")

(Entity "HealthcareChatbot" "System")
(Property "HealthcareChatbot" "type"
         "Mental Health Assistant"
         "version: 1.0 status: active")
(Property "HealthcareChatbot" "capability"
         "Provides therapy advice and health info"
         "framework: gemini confidence: 0.9")

;; Sample relationships with context
(Relationship "HealthcareChatbot" "supports" "MentalHealth"
             "primary_function confidence: 0.95")
(Relationship "HealthcareChatbot" "uses" "Therapy"
             "for_mental_health_support confidence: 0.9")
(Relationship "Therapy" "treats" "Anxiety"
             "common_application confidence: 0.9")
(Relationship "Therapy" "treats" "Depression"
             "standard_treatment confidence: 0.9")
(Relationship "CBT" "isA" "Therapy"
             "specific_type confidence: 0.95")
(Relationship "Meditation" "reduces" "Stress"
             "proven_benefit confidence: 0.85")
(Relationship "Anxiety" "causes" "Stress"
             "common_relationship confidence: 0.9")
(Relationship "Depression" "causes" "Stress"
             "frequent_outcome confidence: 0.85")
(Relationship "HealthcareChatbot" "recommends" "Meditation"
             "for_stress_management confidence: 0.9")
(Relationship "MentalHealth" "affectedBy" "Stress"
             "key_factor confidence: 0.95")

;; Sample categories with descriptions
(Category "Basics" "Root"
         "Fundamental concepts in healthcare and mental health")
(Category "Therapy" "Root"
         "Therapeutic approaches and techniques")
(Category "MentalHealth" "Root"
         "Mental health conditions and management")
(Category "Usage" "Root"
         "How to use the healthcare chatbot")
(Category "Conditions" "MentalHealth"
         "Specific mental health disorders")
(Category "Techniques" "Therapy"
         "Practical therapy methods and tools")

;; Sample synonyms with confidence scores
(Synonym "MentalHealth" "Mental Wellness" 0.9)
(Synonym "Therapy" "Counseling" 0.95)
(Synonym "CBT" "Cognitive Therapy" 0.9)
(Synonym "Anxiety" "Nervousness" 0.85)
(Synonym "Depression" "Sadness Disorder" 0.8)
(Synonym "Meditation" "Mindfulness" 0.95)
(Synonym "Stress" "Tension" 0.9)
(Synonym "HealthcareChatbot" "Health Assistant" 0.9)

;; Sample context relationships with weights
(Context "MentalHealth" "emotional_wellness" 0.95)
(Context "Therapy" "mental_health_support" 0.9)
(Context "CBT" "thought_management" 0.9)
(Context "Anxiety" "fear_response" 0.9)
(Context "Depression" "mood_disorder" 0.95)
(Context "Meditation" "stress_relief" 0.9)
(Context "Stress" "health_impact" 0.9)
(Context "HealthcareChatbot" "patient_support" 0.95)