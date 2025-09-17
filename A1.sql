-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT pizza_type.name,
       round(sum(price * quantity)::numeric,2) AS revenue,
       100 * sum(price * quantity) / sum(sum(price * quantity)) OVER () AS percentage_of_total_revenue
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
JOIN pizza_type ON pizza_type.pizza_type_id = pizzas.Pizza_type_id
GROUP BY pizza_type.name