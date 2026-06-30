-- Show every order with:
  -- User Name
  -- Product Name
  -- Quantity
  -- Unit Price
SELECT o.id as order_id,users.name as username, p.name as product_name, o_it.quantity, o_it.unit_price
  FROM order_items as o_it
JOIN orders as o
  ON o.id = o_it.orderid
JOIN products as p
  ON p.id = o_it.productid
JOIN users
  ON users.id = o.userid;


-- Show the complete details of a single order.
SELECT
    o.id AS order_id,
    o.status,
    o.order_date,
    o.total_price,
    u.name AS customer_name,
    p.name AS product_name,
    o_it.quantity,
    o_it.unit_price
FROM order_items AS o_it
JOIN orders AS o
    ON o.id = o_it.orderid
JOIN products AS p
    ON p.id = o_it.productid
JOIN users AS u
    ON u.id = o.userid
WHERE o.id = 1;

-- Show every user's purchase history.
SELECT u.name as username, o.id as order_id, o.order_date, p.name as product_name, o_it.quantity, o_it.unit_price
  FROM order_items as o_it
JOIN orders as o
  ON o.id = o_it.orderid
JOIN products as p
  ON p.id = o_it.productid
JOIN users as u
  ON u.id = o.userid;
