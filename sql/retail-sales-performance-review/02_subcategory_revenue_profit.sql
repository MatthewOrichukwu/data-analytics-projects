USE RetailAnalytics;

SELECT
    Category,
    Sub_Category,
    SUM(TRY_CAST(Sales AS float))  AS total_revenue,
    SUM(TRY_CAST(Profit AS float)) AS total_profit,
    ROUND(SUM(TRY_CAST(Profit AS float)) / SUM(TRY_CAST(Sales AS float)) * 100, 1) AS profit_margin_pct
FROM superstore_sales
GROUP BY Category, Sub_Category
ORDER BY total_revenue DESC;