-- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_type.name,
       sum(pizzas.price * order_details.quantity) AS revenue
FROM pizza_type
JOIN pizzas ON pizza_type.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_type.name
ORDER BY sum(pizzas.price * order_details.quantity) DESC
LIMIT 3