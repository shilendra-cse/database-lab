-- Revenue per user.
SELECT u.id, u.name, SUM(o.total_price) as revenue
  FROM orders as o
JOIN users as u
  ON o.userid = u.id
GROUP BY u.id, u.name;

-- Orders per user.
SELECT u.id, u.name, COUNT(o.id) as total_orders
  FROM orders as o
JOIN users as u
  ON o.userid = u.id
GROUP BY u.id, u.name;

-- Quantity sold per product.
SELECT p.id, p.name, SUM(o_it.quantity) as units_sold
  FROM order_items as o_it
JOIN products as p
  ON p.id = o_it.productid
GROUP BY p.id, p.name;


-- Average order value per user.
SELECT u.id, u.name, AVG(o.total_price) as AVG_ORD_VAL
  FROM orders as o
JOIN users as u
  ON o.userid = u.id
GROUP BY u.id, u.name;

-- Number of products sold per day.
SELECT o.order_date, SUM(oi.quantity)
  FROM order_items as oi
JOIN orders as o
  ON o.id = oi.orderid
GROUP BY o.order_date;
