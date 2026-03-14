-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- FINAL DATASET FOR POWER BI
-- =====================================

CREATE TABLE ecommerce_analysis AS

SELECT
    o.order_id,
    o.order_date,
    o.shipping_date,
    o.customer_id,
    
    p.product_id,
    p.product_name,
    p.product_category,
    p.manufacturing_city,
    p.size,
    p.color,
    
    o.quantity,
    o.price,
    p.cost_price,
    o.discount_amount,

    -- Revenue
    (o.price * o.quantity) AS revenue,

    -- Cost
    (p.cost_price * o.quantity) AS cost,

    -- Profit
    (o.price * o.quantity)
        - (p.cost_price * o.quantity)
        - o.discount_amount AS profit,

    -- Margin %
    ROUND(
        (
            ((o.price * o.quantity)
            - (p.cost_price * o.quantity)
            - o.discount_amount)
            / NULLIF((o.price * o.quantity),0)
        ) * 100
    ,2) AS margin_percentage

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id;