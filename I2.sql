-- Determine the distribution of orders by hour of the day.

SELECT EXTRACT (HOUR
                FROM order_time) AS order_hour,
               count(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour