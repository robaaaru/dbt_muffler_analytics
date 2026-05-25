SELECT 
    DATE(created_at) AS date, 
    SUM(total_cost) AS daily_revenue,
    COUNT(transaction_id) AS transaction_count
FROM {{ source('muffler_shop', 'transactions') }}
GROUP BY DATE(created_at)
ORDER BY date DESC