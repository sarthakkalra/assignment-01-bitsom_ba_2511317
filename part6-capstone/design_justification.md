\## Storage Systems



The architecture uses a combination of storage systems to meet the four goals efficiently. A Data Lake is used as the central storage layer to handle all raw data, including structured (patient records, billing), semi-structured (logs), and unstructured data (doctor notes, images, and real-time vitals). This enables scalability and flexibility as data volume grows.



For structured and reporting use cases, a Data Warehouse is used. Cleaned and transformed data from the lake is loaded into the warehouse to support monthly reporting such as bed occupancy and department-wise costs. This ensures fast query performance and reliable aggregations for business intelligence.



A Vector Database is introduced to enable natural language querying of patient records. Patient history, clinical notes, and reports are converted into embeddings and stored in the vector database. This allows doctors to ask questions in plain English and retrieve semantically relevant information, rather than relying on keyword matching.



For real-time ICU vitals, a streaming system (e.g., Kafka) feeds data into the data lake, and can also trigger real-time alert systems. Additionally, machine learning models for predicting patient readmission are trained on historical data stored in the data lake and warehouse, ensuring access to comprehensive datasets.



\## OLTP vs OLAP Boundary



The OLTP layer consists of operational systems such as Electronic Health Records (EHR), billing systems, and ICU monitoring devices. These systems are optimized for real-time transactions, frequent updates, and high availability. They handle day-to-day operations like recording patient visits, updating vitals, and processing payments.



The OLAP layer begins once data is ingested into the data lake through ETL or streaming pipelines. From this point onward, the focus shifts to analytics, reporting, and machine learning. The data warehouse forms the core of the OLAP system, supporting complex queries and aggregations required for management reporting. Similarly, the vector database and ML models operate on processed data, enabling semantic search and predictive analytics.



Thus, the boundary lies at the ingestion layer, where raw transactional data is extracted from OLTP systems and transformed for analytical use.



\## Trade-offs



A significant trade-off in this architecture is the increased complexity due to the use of multiple systems (data lake, data warehouse, vector database, and streaming infrastructure). While this modular approach improves scalability and supports diverse use cases, it also introduces challenges in data consistency, system maintenance, and operational overhead.



To mitigate this, a unified Data Lakehouse approach can be adopted, where the data lake incorporates ACID transaction capabilities using technologies like Delta Lake. This reduces the gap between raw and processed data. Additionally, implementing strong data governance practices, centralized metadata management, and automated pipelines (using tools like Airflow) can simplify operations.



By balancing flexibility with governance, the architecture can deliver high performance while maintaining reliability and manageability.

