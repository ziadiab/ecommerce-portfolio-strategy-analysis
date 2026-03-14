-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- PRODUCT MARGIN DISTRIBUTION
-- =====================================

SELECT 
    p.product_name,

    ROUND(
        AVG(
            (
                ((o.price * o.quantity) 
                - (p.cost_price * o.quantity) 
                - o.discount_amount)
                / NULLIF((o.price * o.quantity),0)
            ) * 100
        ), 2
    ) AS avg_margin_percentage,
    
    SUM(o.price * o.quantity) AS total_revenue

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_margin_percentage DESC;


-- =====================================
-- REVENUE IMPACT OF LOSS ORDERS
-- =====================================

SELECT 
    SUM(o.price * o.quantity) AS total_revenue,

    SUM(
        CASE 
            WHEN ((o.price * o.quantity) 
                  - (p.cost_price * o.quantity) 
                  - o.discount_amount) < 0 
            THEN (o.price * o.quantity)
            ELSE 0
        END
    ) AS revenue_from_loss_orders,

    SUM(
        CASE 
            WHEN ((o.price * o.quantity) 
                  - (p.cost_price * o.quantity) 
                  - o.discount_amount) < 0 
            THEN ((o.price * o.quantity) 
                  - (p.cost_price * o.quantity) 
                  - o.discount_amount)
            ELSE 0
        END
    ) AS total_loss_amount

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id;


-- =====================================
-- REVENUE + MARGIN ANALYSIS
-- =====================================

SELECT 
    p.product_name,
    SUM(o.price * o.quantity) AS total_revenue,
    
    ROUND(
        AVG(
            (
                ((o.price * o.quantity) 
                - (p.cost_price * o.quantity) 
                - o.discount_amount)
                / NULLIF((o.price * o.quantity),0)
            ) * 100
        ), 2
    ) AS avg_margin_percentage

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;