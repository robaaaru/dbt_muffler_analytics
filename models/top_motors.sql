SELECT 
    m.motor_id, 
    m.brand, 
    m.model,
    COUNT(o.order_id) AS total_orders, 
    SUM(o.quantity * o.order_cost) AS total_revenue 
FROM {{ source('muffler_shop', 'motors') }} AS m
JOIN {{ source('muffler_shop', 'orders') }} AS o USING (motor_id)
GROUP BY m.motor_id, m.brand, m.model
ORDER BY total_orders DESC