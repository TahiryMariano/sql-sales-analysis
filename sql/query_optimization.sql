CREATE INDEX idx_customer ON superstore_sales (customer_id);
CREATE INDEX idx_order_date ON superstore_sales (order_date);       
CREATE INDEX idx_region ON superstore_sales (region);

-- Test de performance
EXPLAIN ANALYZE
SELECT * 
FROM superstore_sales
WHERE region = 'west';