-- =========================================
-- DROP TABLES (for re-run safety)
-- =========================================
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;

-- =========================================
-- DIMENSION TABLES
-- =========================================

-- Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Product Dimension
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- =========================================
-- FACT TABLE
-- =========================================

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    store_id INT,
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================================
-- INSERT CLEANED DATA
-- =========================================

-- dim_date (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024),
(4, '2024-01-04', 4, 1, 2024),
(5, '2024-01-05', 5, 1, 2024);

-- dim_store
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Pune');

-- dim_product (fixed inconsistent casing)
INSERT INTO dim_product VALUES
('P001', 'Laptop', 'Electronics'),
('P002', 'Shirt', 'Clothing'),
('P003', 'Milk', 'Groceries'),
('P004', 'Mobile', 'Electronics'),
('P005', 'Rice', 'Groceries');

-- fact_sales (cleaned values, no NULLs)
INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_amount) VALUES
(1, 1, 'P001', 1, 50000),
(1, 1, 'P002', 2, 4000),
(2, 2, 'P003', 5, 300),
(2, 2, 'P004', 1, 20000),
(3, 3, 'P005', 3, 1500),
(3, 1, 'P001', 1, 50000),
(4, 2, 'P002', 1, 2000),
(4, 3, 'P003', 10, 600),
(5, 1, 'P004', 2, 40000),
(5, 2, 'P005', 4, 2000);