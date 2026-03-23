\## Vector DB Use Case



A traditional keyword-based database search would not be sufficient for a system where lawyers need to query large contracts using natural language. Keyword search relies on exact or partial word matches, which means it may fail to retrieve relevant sections if the wording in the contract differs from the query. For example, a lawyer searching for “termination clauses” might miss sections labeled as “contract cancellation” or “agreement ending conditions.” This lack of semantic understanding limits the effectiveness of keyword-based approaches, especially in complex legal documents.



In contrast, a vector database enables semantic search by using embeddings to capture the meaning of text rather than just matching keywords. Each section of the contract can be converted into vector embeddings, which represent the contextual meaning of the content. Similarly, a user’s query is also converted into an embedding. The system can then compute similarity between the query vector and document vectors to retrieve the most relevant sections, even if the exact words do not match.



This approach is particularly valuable for long documents like 500-page contracts, where relevant information may be buried in dense text with varied terminology. A vector database allows efficient storage and retrieval of embeddings, enabling fast similarity searches at scale.



Therefore, a vector database plays a critical role in enabling accurate, context-aware, and efficient search, making it far superior to traditional keyword-based methods for this use case.

