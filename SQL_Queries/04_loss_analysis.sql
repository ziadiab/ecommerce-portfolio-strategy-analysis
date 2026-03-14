-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- LOSS ANALYSIS
-- Identify loss-making orders
-- =====================================

SELECT 
    COUNT(*) AS total_orders,

    SUM(
        CASE 
            WHEN ((o.price * o.quantity) 
                  - (p.cost_price * o.quantity) 
                  - o.discount_amount) < 0 
            THEN 1 
            ELSE 0 
        END
    ) AS loss_orders

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id;