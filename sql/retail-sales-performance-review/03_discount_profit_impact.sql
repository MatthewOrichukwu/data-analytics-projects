USE RetailAnalytics;

SELECT
    CASE
        WHEN TRY_CAST(Discount AS float) = 0    THEN '0% (none)'
        WHEN TRY_CAST(Discount AS float) <= 0.2 THEN '1-20%'
        WHEN TRY_CAST(Discount AS float) <= 0.4 THEN '21-40%'
        ELSE '41%+'
    END AS discount_band,
    COUNT(*) AS order_lines,
    SUM(TRY_CAST(Sales AS float))  AS total_revenue,
    SUM(TRY_CAST(Profit AS float)) AS total_profit,
    ROUND(SUM(TRY_CAST(Profit AS float)) / SUM(TRY_CAST(Sales AS float)) * 100, 1) AS profit_margin_pct
FROM superstore_sales
GROUP BY CASE
        WHEN TRY_CAST(Discount AS float) = 0    THEN '0% (none)'
        WHEN TRY_CAST(Discount AS float) <= 0.2 THEN '1-20%'
        WHEN TRY_CAST(Discount AS float) <= 0.4 THEN '21-40%'
        ELSE '41%+'
    END
ORDER BY discount_band;