-- Analyze the cumulative revenue generated over time.

SELECT order_date,
       sum(revenue) over(
                         ORDER BY order_date) AS cum_revenue
FROM
  (SELECT orders.order_date,
          round(sum(pizzas.price * order_details.quantity)::numeric, 2) AS revenue
   FROM pizzas
   JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
   JOIN orders ON orders.order_id = order_details.order_id
   GROUP BY orders.order_date
   ORDER BY orders.order_date) AS sales

