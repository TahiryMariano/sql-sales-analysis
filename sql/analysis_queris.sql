-- Top customers 
WITH customer_sales AS (
    SELECT 
        customer_id, 
        customer_name,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY customer_id, customer_name
)

SELECT * FROM customer_sales
ORDER BY total_sales DESC
LIMIT 10;

-- Customer ranking
SELECT 
    customer_id, 
    customer_name,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS rank
FROM superstore_sales
GROUP BY customer_id, customer_name;

-- Monthly sales 
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS monthly_profit
FROM superstore_sales
GROUP BY month
ORDER BY month;

-- Top products by region
SELECT *
FROM (
    SELECT
        region,
        product_name,
        SUM(quantity) AS total_quantity,
        RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(quantity) DESC
        ) AS rank
    FROM superstore_sales
    GROUP BY region, product_name
) ranked
WHERE rank = 1;

