
-- TASK 6: SALES TREND ANALYSIS USING AGGREGATIONS
-- Tool: DB Browser for SQLite

-- 1. Preview Dataset
SELECT *
FROM online_sales
LIMIT 10;

-- 2. Check Total Number of Records
SELECT COUNT(*) AS total_records
FROM online_sales;

-- 3. Check Table Structure
PRAGMA table_info(online_sales);

-- 4. Check Order Date Format
SELECT "Order Date"
FROM online_sales
LIMIT 10;

-- 5. MONTHLY REVENUE ANALYSIS
SELECT 
    substr("Order Date", 7, 4) AS year,
    substr("Order Date", 4, 2) AS month,
    SUM("Sales") AS total_revenue
FROM online_sales
GROUP BY 
    substr("Order Date", 7, 4),
    substr("Order Date", 4, 2)
ORDER BY 
    year,
    month;

-- 6. MONTHLY ORDER VOLUME
SELECT 
    substr("Order Date", 7, 4) AS year,
    substr("Order Date", 4, 2) AS month,
    COUNT(DISTINCT "Order ID") AS order_volume
FROM online_sales
GROUP BY 
    substr("Order Date", 7, 4),
    substr("Order Date", 4, 2)
ORDER BY 
    year,
    month;

-- 7. MAIN SALES TREND ANALYSIS
-- Monthly Revenue + Order Volume
SELECT 
    substr("Order Date", 7, 4) AS year,
    substr("Order Date", 4, 2) AS month,
    SUM("Sales") AS total_revenue,
    COUNT(DISTINCT "Order ID") AS order_volume
FROM online_sales
GROUP BY 
    substr("Order Date", 7, 4),
    substr("Order Date", 4, 2)
ORDER BY 
    year,
    month;

-- 8. TOP 3 MONTHS BY SALES
SELECT 
    substr("Order Date", 7, 4) AS year,
    substr("Order Date", 4, 2) AS month,
    SUM("Sales") AS total_revenue
FROM online_sales
GROUP BY 
    substr("Order Date", 7, 4),
    substr("Order Date", 4, 2)
ORDER BY 
    total_revenue DESC
LIMIT 3;

-- 9. YEARLY REVENUE ANALYSIS
SELECT 
    substr("Order Date", 7, 4) AS year,
    SUM("Sales") AS yearly_revenue
FROM online_sales
GROUP BY 
    substr("Order Date", 7, 4)
ORDER BY year;