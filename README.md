# E-Commerce Sales Analytics Using SQL

## 1. Introduction

This case study analyzes an e-commerce sales dataset using SQL to understand sales performance, customer behavior, regional performance, payment methods, delivery performance, discounts, and revenue trends.

## 2. Dataset

- **Dataset:** E-Commerce Sales Analytics
- **Source:** Kaggle
- **Records:** 5,000
- **Database:** MySQL
- **Table:** `ecommerce_sales_analytics_5000`

## 3. Main Columns

`order_id`, `order_date`, `customer_id`, `product_category`, `region`, `quantity`, `unit_price`, `discount`, `payment_method`, `delivery_days`, `customer_rating`, `revenue`

## 4. SQL Analysis

The project includes:

- Basic `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- Aggregation using `SUM()`, `AVG()`, `COUNT()`
- Common Table Expressions (CTEs)
- Window functions
- `RANK()`
- `LAG()`
- `NTILE()`
- Date conversion and analysis
- Customer segmentation
- Year-over-year revenue analysis
- Cumulative revenue analysis

## 5. Business Analysis Areas

The analysis examines:

- Product-category revenue
- Regional revenue
- Customer value
- Payment-method usage
- Delivery performance
- Discount patterns
- Revenue growth

## 6. Business Insights

The SQL analysis provides a structured view of sales and operational performance across product categories, regions, customers, payment methods, delivery times, discounts, and yearly revenue trends.

## 7. Business Recommendations

- Focus on high-performing product categories through appropriate inventory and marketing planning.
- Analyze regional performance and develop strategies based on differences in revenue and operational performance.
- Use customer value tiers to support loyalty programs and personalized offers for high-value customers.
- Monitor payment-method preferences and maintain convenient checkout options.
- Investigate regions with higher delivery times and identify opportunities for logistics improvement.
- Evaluate discounts together with revenue to avoid unnecessary discounting.
- Monitor year-over-year revenue changes to support future sales planning.

## 8. Conclusion

This SQL case study demonstrates how an e-commerce dataset can be transformed into meaningful business information using SQL. The analysis examined revenue, product categories, regions, customers, payment methods, delivery performance, discounts, and yearly revenue trends. Advanced SQL techniques such as CTEs and window functions were also used to identify customer rankings, cumulative revenue, year-over-year growth, and customer value tiers. These findings can help businesses understand sales patterns, customer behavior, and operational performance and support data-driven decision-making.

## 9. Dataset Limitation

The selected dataset does not contain a cost or profit column. Therefore, the analysis focuses on revenue and related sales and operational measures rather than actual profit or profit margin.

## 10. Tools Used

- MySQL
- MySQL Workbench
- SQL
- Kaggle

## 11. Repository Contents

```text
ecommerce-sql-case-study/
├── README.md
├── ecommerce_analysis.sql
├── ecommerce_sales_analytics_5000.csv
└── Ecommerce_Sales_Analytics_SQL_Case_Study.docx
```

## 12. Author

**Antony Ignatius**  
B.Tech – Computer Science and Engineering  
Sree Narayana Gurukulam College of Engineering
