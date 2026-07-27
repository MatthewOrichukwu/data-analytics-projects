USE RetailAnalytics;
GO

CREATE VIEW vw_superstore_clean AS
SELECT
    Row_ID,
    Order_ID,
    TRY_CAST(Order_Date AS date)    AS Order_Date,
    TRY_CAST(Ship_Date AS date)     AS Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    TRY_CAST(Sales AS float)        AS Sales,
    TRY_CAST(Quantity AS int)       AS Quantity,
    TRY_CAST(Discount AS float)     AS Discount,
    TRY_CAST(Profit AS float)       AS Profit
FROM superstore_sales;