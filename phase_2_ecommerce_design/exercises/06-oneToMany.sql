-----JOINS AND GROUP BY-----

-- Show every order along with the user who placed it.
SELECT orders.id as orderId, orders.userid, users.name, orders.status, orders.total_price, orders.order_date FROM orders
JOIN users
ON orders.userid= users.id;

-- Show all orders placed by a specific user.
SELECT orders.id as orderId, orders.userid, users.name, orders.status, orders.total_price, orders.order_date FROM orders
JOIN users
ON orders.userId = users.id
WHERE users.id=1;

-- Count how many orders each user has placed.
SELECT users.id, users.name, count(orders.id) AS total_orders FROM orders
JOIN users
ON orders.userId = users.id
GROUP BY users.id, users.name
ORDER BY id ASC;

-- Which user has placed the most orders?
SELECT users.id, users.name, count(orders.id) AS total_orders FROM orders
JOIN users
ON orders.userId = users.id
GROUP BY users.id, users.name
ORDER BY total_orders DESC
LIMIT 1;
