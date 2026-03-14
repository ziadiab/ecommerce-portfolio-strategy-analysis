-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- PROFIT ENGINE
-- Create core profitability calculations
-- =====================================

SELECT 
    o.order_id,
    o.product_id,
    p.product_name,
    p.product_category,
    p.manufacturing_city,
    o.quantity,
    o.price,
    p.cost_price,
    o.discount_amount,
    
    -- Revenue
    (o.price * o.quantity) AS revenue,
    
    -- Cost
    (p.cost_price * o.quantity) AS cost,
    
    -- Gross Profit
    (o.price * o.quantity) 
        - (p.cost_price * o.quantity) 
        - o.discount_amount AS gross_profit,
    
    -- Margin %
    ROUND(
    (
        ((o.price * o.quantity) 
        - (p.cost_price * o.quantity) 
        - o.discount_amount)
        / NULLIF((o.price * o.quantity),0)
	    ) * 100, 2
	) AS margin_percentage

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id;