USE RetailAnalytics;

SELECT
    YEAR(TRY_CAST (Order_Date AS date)) AS order_year,
    SUM(TRY_CAST (Sales AS float))     AS total_revenue,
    SUM(TRY_CAST (Profit AS float))    AS total_profit,
    ROUND(SUM(TRY_CAST(Profit AS float)) / SUM(TRY_CAST(Sales AS float)) * 100, 1) AS profit_margin_pct
FROM superstore_sales
GROUP BY YEAR(TRY_CAST(Order_Date AS date))
ORDER BY order_year;