-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- PRODUCT PORTFOLIO SEGMENTATION
-- =====================================

WITH product_metrics AS (

SELECT 
    p.product_name,
    
    SUM(o.price * o.quantity) AS revenue,

    ROUND(
        AVG(
            (
                ((o.price * o.quantity)
                - (p.cost_price * o.quantity)
                - o.discount_amount)
                / NULLIF((o.price * o.quantity),0)
            ) * 100
        ),2
    ) AS avg_margin

FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.product_id

GROUP BY p.product_name
)

SELECT *,
CASE
    WHEN revenue >= (SELECT AVG(revenue) FROM product_metrics)
     AND avg_margin >= (SELECT AVG(avg_margin) FROM product_metrics)
    THEN 'Star Product'

    WHEN revenue >= (SELECT AVG(revenue) FROM product_metrics)
     AND avg_margin < (SELECT AVG(avg_margin) FROM product_metrics)
    THEN 'Volume Driver'

    WHEN revenue < (SELECT AVG(revenue) FROM product_metrics)
     AND avg_margin >= (SELECT AVG(avg_margin) FROM product_metrics)
    THEN 'Hidden Gem'

    ELSE 'Weak Product'
END AS product_segment

FROM product_metrics
ORDER BY revenue DESC;