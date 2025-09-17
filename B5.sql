-- List the top 5 most ordered pizza types along with their quantities.

SELECT pizza_type.name,
       sum(order_details.quantity) AS quantity
FROM pizza_type
JOIN pizzas ON pizza_type.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_type.name
ORDER BY quantity DESC
LIMIT 5
