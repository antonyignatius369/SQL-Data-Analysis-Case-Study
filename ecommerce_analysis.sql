-- E-Commerce Sales Analytics Using SQL
-- Database: ecommerce_case_study
-- Table: ecommerce_sales_analytics_5000

USE ecommerce_case_study;

-- 1. Orders by Product Category
SELECT product_category, COUNT(*) AS total_orders
FROM ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY total_orders DESC;

-- 2. Total Revenue by Product Category
SELECT product_category, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 3. Total Revenue by Region
SELECT region, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY total_revenue DESC;

-- 4. Payment Method Analysis
SELECT payment_method, COUNT(*) AS total_orders,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 5. Average Customer Rating by Category
SELECT product_category, ROUND(AVG(customer_rating), 2) AS avg_rating
FROM ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY avg_rating DESC;

-- 6. Average Delivery Days by Region
SELECT region, ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY avg_delivery_days ASC;

-- 7. Orders and Revenue by Region
SELECT region, COUNT(*) AS total_orders,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY total_revenue DESC;

-- 8. Revenue by Region and Payment Method
SELECT region, payment_method,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY region, payment_method
ORDER BY region, total_revenue DESC;

-- 9. Monthly Revenue Trend
SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS order_month,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY order_month
ORDER BY order_month;

-- 10. Top 10 Customers by Revenue
SELECT customer_id, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 11. Average Revenue by Region
SELECT region, ROUND(AVG(revenue), 2) AS avg_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY avg_revenue DESC;

-- 12. Revenue by Category and Region
SELECT product_category, region,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY product_category, region
ORDER BY total_revenue DESC;

-- 13. Total Quantity by Category
SELECT product_category, SUM(quantity) AS total_quantity
FROM ecommerce_case_study.ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY total_quantity DESC;

-- 14. Average Customer Rating by Region
SELECT region, ROUND(AVG(customer_rating), 2) AS avg_rating
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY avg_rating DESC;

-- 15. Revenue by Category and Payment Method
SELECT product_category, payment_method,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY product_category, payment_method
ORDER BY product_category, total_revenue DESC;

-- 16. Average Discount by Product Category
SELECT product_category,
       ROUND(AVG(discount) * 100, 2) AS avg_discount_percent
FROM ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY avg_discount_percent DESC;

-- 17. Rank Customers Within Each Region
WITH customer_region_sales AS (
    SELECT region, customer_id, SUM(revenue) AS total_revenue
    FROM ecommerce_sales_analytics_5000
    GROUP BY region, customer_id
)
SELECT region, customer_id,
       ROUND(total_revenue, 2) AS total_revenue,
       RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS customer_rank
FROM customer_region_sales
ORDER BY region, customer_rank;

-- 18. Cumulative Revenue Over Time
WITH daily_sales AS (
    SELECT STR_TO_DATE(order_date, '%m/%d/%Y') AS order_date,
           SUM(revenue) AS daily_revenue
    FROM ecommerce_sales_analytics_5000
    GROUP BY STR_TO_DATE(order_date, '%m/%d/%Y')
)
SELECT order_date, ROUND(daily_revenue, 2) AS daily_revenue,
       ROUND(SUM(daily_revenue) OVER (ORDER BY order_date), 2) AS cumulative_revenue
FROM daily_sales
ORDER BY order_date;

-- 19. Year-over-Year Revenue Growth
WITH yearly AS (
    SELECT YEAR(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_year,
           SUM(revenue) AS total_revenue
    FROM ecommerce_sales_analytics_5000
    GROUP BY YEAR(STR_TO_DATE(order_date, '%m/%d/%Y'))
),
growth AS (
    SELECT order_year, total_revenue,
           LAG(total_revenue) OVER (ORDER BY order_year) AS previous_year_revenue
    FROM yearly
)
SELECT order_year, ROUND(total_revenue, 2) AS total_revenue,
       ROUND(previous_year_revenue, 2) AS previous_year_revenue,
       ROUND((total_revenue - previous_year_revenue) /
             NULLIF(previous_year_revenue, 0) * 100, 2) AS yoy_growth_percent
FROM growth
ORDER BY order_year;

-- 20. Customer Value Tiers Using NTILE
WITH customer_sales AS (
    SELECT customer_id, SUM(revenue) AS total_revenue
    FROM ecommerce_sales_analytics_5000
    GROUP BY customer_id
),
tiered_customers AS (
    SELECT customer_id, total_revenue,
           NTILE(4) OVER (ORDER BY total_revenue DESC) AS quartile
    FROM customer_sales
)
SELECT customer_id, ROUND(total_revenue, 2) AS total_revenue,
       CASE
           WHEN quartile = 1 THEN 'High Value'
           WHEN quartile IN (2, 3) THEN 'Medium Value'
           ELSE 'Low Value'
       END AS value_tier
FROM tiered_customers
ORDER BY total_revenue DESC;

-- 21. Highest-Revenue Product Category
SELECT product_category, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 1;

-- 22. Highest-Revenue Region
SELECT region, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY region
ORDER BY total_revenue DESC
LIMIT 1;

-- 23. Highest-Revenue Payment Method
SELECT payment_method, COUNT(*) AS total_orders,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales_analytics_5000
GROUP BY payment_method
ORDER BY total_revenue DESC
LIMIT 1;
