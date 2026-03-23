\## Anomaly Analysis



\### Insert Anomaly

In the current dataset, new entities such as products or sales representatives cannot be added independently without creating an order.



Example:

Columns involved: product\_id, product\_name, category, unit\_price  



Since product information exists only as part of an order record, a new product cannot be inserted unless an order is created. Similarly, a new sales representative (sales\_rep\_id, sales\_rep\_name, sales\_rep\_email) cannot be added without linking them to an order. This restricts flexibility and leads to improper data entry practices.



---



\### Update Anomaly

There is inconsistency in repeated data, particularly in office address for the same sales representative.



Example:

Rows: 1 and 37  

Columns: sales\_rep\_id, office\_address  



For sales\_rep\_id = 'SR01', the office address appears as:

\- "Mumbai HQ, Nariman Point, Mumbai - 400021"

\- "Mumbai HQ, Nariman Pt, Mumbai - 400021"



This shows inconsistent data representation for the same entity. If the office address needs correction, it must be updated in multiple rows, increasing the risk of inconsistency.



---



\### Delete Anomaly

Deleting a single row can result in loss of important product information.



Example:

Row: 11  

Columns: product\_id, product\_name, category  



Product with product\_id = 'P008' appears only once in the dataset. If this row is deleted, all information about this product will be lost from the system, even though the product may still exist in reality.



This leads to unintended data loss.

## Normalization Justification

Although storing all data in a single table may appear simpler, the provided dataset clearly highlights why normalization is necessary. The flat structure leads to redundancy, inconsistency, and data management challenges.

For instance, the same sales representative (sales_rep_id = 'SR01') appears across multiple rows with inconsistent office addresses such as "Nariman Point" and "Nariman Pt". This demonstrates an update anomaly—any correction must be applied in multiple rows, increasing the risk of inconsistent data. Similarly, customer details like email and city are repeated across orders, making updates error-prone.

Insert anomalies are also evident. A new product (e.g., a new product_id) or a new sales representative cannot be added unless an order is created, which is impractical and forces incorrect data entry. This limits the system’s ability to represent real-world entities independently.

Delete anomalies pose an even greater risk. For example, product_id 'P008' appears only once in the dataset. If that row is deleted, all information about that product is permanently lost, even though the product may still exist in reality.

By normalizing the data into separate tables such as Customers, Products, Orders, and Sales_Reps, each entity is stored only once. This eliminates redundancy and ensures consistency through proper relationships using primary and foreign keys.

Therefore, normalization is not over-engineering but a critical design approach that improves data integrity, scalability, and maintainability.