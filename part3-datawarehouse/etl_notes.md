\## ETL Decisions



\### Decision 1 — Standardizing Date Formats

Problem: The raw dataset contained inconsistent date formats such as "01-01-2024", "2024/01/02", and "Jan 3 2024". This inconsistency makes it difficult to perform time-based analysis and join with a date dimension table.



Resolution: All date values were transformed into a standardized ISO format (YYYY-MM-DD) before loading into the data warehouse. Additionally, a surrogate key (date\_id) was created in the dim\_date table to enable efficient joins and consistent time-based reporting.



---



\### Decision 2 — Handling NULL and Missing Values

Problem: The dataset contained NULL or missing values in key fields such as product category, store name, and transaction amounts. This could lead to inaccurate aggregations and incomplete analytical results.



Resolution: Missing values were handled based on context. For critical fields like category and store, NULL values were replaced with a default value such as "Unknown" or inferred from related data where possible. For numeric fields like total\_amount, records with missing values were either cleaned or excluded to maintain data accuracy.



---



\### Decision 3 — Fixing Inconsistent Category Casing

Problem: Product categories in the raw data had inconsistent casing such as "electronics", "Electronics", and "ELECTRONICS". This would result in incorrect grouping and fragmented reporting in analytical queries.



Resolution: All category values were standardized to a consistent format (e.g., "Electronics", "Clothing", "Groceries") using transformation rules during the ETL process. This ensured accurate aggregation and grouping in reports such as revenue by category.

