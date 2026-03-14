-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- BASIC DATA EXPLORATION
-- =====================================

-- Total number of orders
SELECT COUNT(*) 
FROM orders;

-- Total number of products
SELECT COUNT(*)
FROM products;

-- Confirm 5 Products Have No Orders
SELECT p.product_id
FROM products AS p
LEFT JOIN orders AS o
ON p.product_id = o.product_id
WHERE o.product_id IS NULL;

-- Index
CREATE INDEX idx_orders_product_id
ON orders(product_id);