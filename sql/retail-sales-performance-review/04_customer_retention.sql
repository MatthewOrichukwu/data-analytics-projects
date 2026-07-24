USE RetailAnalytics;

-- Retention: of customers who bought in 2016, how many returned in 2017?
SELECT
    COUNT(DISTINCT c2016.Customer_ID) AS customers_2016,
    COUNT(DISTINCT c2017.Customer_ID) AS returned_2017,
    ROUND(COUNT(DISTINCT c2017.Customer_ID) * 100.0 / COUNT(DISTINCT c2016.Customer_ID), 1) AS retention_pct
FROM (SELECT DISTINCT Customer_ID FROM superstore_sales
      WHERE YEAR(TRY_CAST(Order_Date AS date)) = 2016) c2016
LEFT JOIN (SELECT DISTINCT Customer_ID FROM superstore_sales
      WHERE YEAR(TRY_CAST(Order_Date AS date)) = 2017) c2017
  ON c2016.Customer_ID = c2017.Customer_ID;

-- Value: one-time vs repeat customers across the full period
SELECT
    CASE WHEN order_count = 1 THEN 'One-time' ELSE 'Repeat' END AS customer_type,
    COUNT(*) AS customers,
    ROUND(AVG(customer_revenue), 0) AS avg_revenue_per_customer
FROM (
    SELECT Customer_ID,
           COUNT(DISTINCT Order_ID) AS order_count,
           SUM(TRY_CAST(Sales AS float)) AS customer_revenue
    FROM superstore_sales
    GROUP BY Customer_ID
) t
GROUP BY CASE WHEN order_count = 1 THEN 'One-time' ELSE 'Repeat' END;