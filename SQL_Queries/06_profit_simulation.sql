-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- PROFIT SIMULATION
-- Impact of reducing discounts by 20%
-- =====================================

SELECT 
    SUM(o.price * o.quantity) AS total_revenue,

    SUM(
        (o.price * o.quantity) 
        - (p.cost_price * o.quantity) 
        - o.discount_amount
    ) AS current_total_profit,

    SUM(
        (o.price * o.quantity) 
        - (p.cost_price * o.quantity) 
        - (o.discount_amount * 0.8)
    ) AS profit_if_discount_reduced_20

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id;