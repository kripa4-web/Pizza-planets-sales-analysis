-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT round(avg(daily_pizzas), 2) AS average_pizzas_per_day
FROM
  (SELECT orders.order_date,
          sum(order_details.quantity) AS daily_pizzas
   FROM orders
   JOIN order_details ON orders.order_id = order_details.order_id
   GROUP BY orders.order_date) AS sub
