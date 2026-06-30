-- Which products have been purchased the most?
SELECT p.id, p.name, SUM(o_it.quantity) as total_sold
FROM order_items as o_it
JOIN products as p
  ON p.id = o_it.productid
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 5;

-- Which products generated the highest revenue?
SELECT p.id, p.name, SUM(o_it.quantity * o_it.unit_price) as revenue
FROM order_items as o_it
JOIN products as p
  ON p.id = o_it.productid
GROUP BY p.id, p.name
ORDER BY revenue DESC
LIMIT 5;

-- Which users spent the most money?
SELECT u.id as user_id, u.name, SUM(o.total_price) as total_spend
FROM orders as o
JOIN users as u
  ON o.userid = u.id
GROUP BY u.id
ORDER BY total_spend desc
LIMIT 5;

-- What is the average order value?
SELECT AVG(orders.total_price) as AVG_ORD_VAL FROM orders;

-- Which order has the highest total price?
SELECT orders.total_price as highest_total_price, orders.id FROM orders ORDER BY orders.total_price DESC LIMIT 1;

-- Which day had the highest sales?
SELECT orders.order_date, SUM(orders.total_price) as total_sales FROM orders GROUP BY order_date ORDER BY total_sales DESC LIMIT 1;

-- How many products were sold in total?
SELECT SUM(o_it.quantity) as total_products_sold
  FROM order_items as o_it;
