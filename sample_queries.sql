-- Create a database
CREATE DATABASE IF NOT EXISTS sales_db;

-- Use the database
USE sales_db;

-- Create a table for sales data
CREATE TABLE sales (
    date Date,
    product_category String,
    product_name String,
    quantity Int32,
    price Float32,
    total_revenue Float32,
    region String
) ENGINE = MergeTree()
ORDER BY (date, product_category);

-- Insert sample sales data
INSERT INTO sales 
(date, product_category, product_name, quantity, price, total_revenue, region)
VALUES 
('2024-01-01', 'Electronics', 'Laptop', 5, 1200.50, 6002.50, 'North'),
('2024-01-01', 'Electronics', 'Smartphone', 10, 800.25, 8002.50, 'South'),
('2024-01-02', 'Clothing', 'T-Shirt', 20, 25.00, 500.00, 'East'),
('2024-01-02', 'Clothing', 'Jeans', 15, 75.50, 1132.50, 'West'),
('2024-01-03', 'Home Appliances', 'Refrigerator', 3, 1500.00, 4500.00, 'North'),
('2024-01-03', 'Home Appliances', 'Microwave', 7, 250.75, 1755.25, 'South'),
('2024-01-04', 'Electronics', 'Tablet', 8, 450.00, 3600.00, 'East'),
('2024-01-04', 'Electronics', 'Smartwatch', 12, 300.25, 3603.00, 'West');