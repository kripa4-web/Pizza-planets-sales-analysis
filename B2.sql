-- Calculate the total revenue generated from pizza sales.

SELECT round(sum(pizzas.price * order_details.quantity)::numeric, 2) AS total_revenue
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id