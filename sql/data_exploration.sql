
-- Nombre de lignes dans la table superstore_sales
SELECT COUNT(*) AS total_rows FROM superstore_sales;

-- Distribution des régions 
SELECT region, COUNT(*) FROM superstore_sales GROUP BY region;  