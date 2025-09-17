-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT category,
       name,
       revenue
FROM
  (SELECT category,
          name,
          revenue,
          rank() over(PARTITION BY category
                      ORDER BY revenue DESC) AS rnk
   FROM
     (SELECT pizza_type.category,
             pizza_type.name,
             sum(order_details.quantity * pizzas.price) AS revenue
      FROM pizzas
      JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
      JOIN pizza_type ON pizza_type.pizza_type_id = pizzas.pizza_type_id
      GROUP BY pizza_type.category,
               pizza_type.name) AS a) AS b
WHERE rnk <= 3