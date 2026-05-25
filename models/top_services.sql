SELECT 
    s.service_id, 
    s.service_type, 
    COUNT(o.order_id) AS total_orders, 
    SUM(o.order_cost * o.quantity) AS total_revenue 
FROM {{ source('muffler_shop', 'services') }} AS s 
JOIN {{ source('muffler_shop', 'orders') }} AS o USING (service_id) 
GROUP BY s.service_id 
ORDER BY total_orders DESC