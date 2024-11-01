-- Tab 1 : Revenue Analysis Visualizations
-- Total Revenue by Product Category
SELECT 
    product_category, 
    ROUND(SUM(total_revenue), 2) AS total_category_revenue
FROM sales
GROUP BY product_category
ORDER BY total_category_revenue DESC;

-- Revenue Distribution Across Regions
SELECT 
    region, 
    ROUND(SUM(total_revenue), 2) AS total_regional_revenue
FROM sales
GROUP BY region

-- Daily Revenue Trend
SELECT 
    date, 
    ROUND(SUM(total_revenue), 2) AS daily_revenue
FROM sales
GROUP BY date
ORDER BY date;

-- Tab 2 : Sales Performance Visualizations
-- Quantity Sold by Product Category and Region
SELECT 
    product_category, 
    region, 
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM sales
GROUP BY product_category, region
ORDER BY total_quantity_sold DESC;

-- Quantity vs Total Revenue by Product
SELECT 
    product_name,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;

-- Quantity Sold vs. Total Revenue
WITH product_performance AS (
    SELECT 
        product_name,
        SUM(quantity) AS total_quantity_sold,
        ROUND(SUM(total_revenue), 2) AS total_revenue,
        ROUND(AVG(price), 2) AS average_price
    FROM sales
    GROUP BY product_name
)
SELECT 
    product_name,
    total_quantity_sold,
    total_revenue
FROM product_performance
ORDER BY total_revenue DESC;

