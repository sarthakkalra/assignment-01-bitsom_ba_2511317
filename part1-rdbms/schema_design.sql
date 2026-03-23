-- ================================
-- CREATE TABLES (3NF Design)
-- ================================

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) UNIQUE NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ================================
-- INSERT DATA
-- ================================

-- Customers
INSERT INTO Customers (customer_name, customer_email, customer_city) VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Mumbai'),
('Priya Singh', 'priya@gmail.com', 'Delhi'),
('Amit Verma', 'amit@gmail.com', 'Mumbai'),
('Neha Jain', 'neha@gmail.com', 'Pune'),
('Ravi Kumar', 'ravi@gmail.com', 'Bangalore');

-- Products
INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 50000),
('P002', 'Mobile', 'Electronics', 20000),
('P003', 'Headphones', 'Accessories', 2000),
('P004', 'Chair', 'Furniture', 3000),
('P005', 'Desk', 'Furniture', 7000);

-- Sales Representatives
INSERT INTO Sales_Reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Ankit Mehta', 'ankit@company.com', 'Mumbai HQ'),
('SR02', 'Riya Kapoor', 'riya@company.com', 'Delhi Office'),
('SR03', 'Vikas Sharma', 'vikas@company.com', 'Pune Office'),
('SR04', 'Sneha Gupta', 'sneha@company.com', 'Bangalore Office'),
('SR05', 'Arjun Nair', 'arjun@company.com', 'Chennai Office');

-- Orders
INSERT INTO Orders (customer_id, sales_rep_id, order_date) VALUES
(1, 'SR01', '2024-01-10'),
(2, 'SR02', '2024-01-12'),
(3, 'SR01', '2024-01-15'),
(4, 'SR03', '2024-01-18'),
(5, 'SR04', '2024-01-20');

-- Order Items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 'P001', 1),
(1, 'P003', 2),
(2, 'P002', 1),
(3, 'P004', 3),
(4, 'P005', 1),
(5, 'P001', 1);