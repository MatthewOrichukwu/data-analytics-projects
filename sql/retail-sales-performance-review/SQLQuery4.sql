USE RetailAnalytics;

SELECT
    Region,
    Ship_Mode,
    COUNT(*) AS order_lines,
    ROUND(AVG(CAST(DATEDIFF(day, TRY_CAST(Order_Date AS date), TRY_CAST(Ship_Date AS date)) AS float)), 1) AS avg_days_to_ship
FROM superstore_sales
GROUP BY Region, Ship_Mode
ORDER BY Region, avg_days_to_ship;