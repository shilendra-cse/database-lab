-- Show the 5 most expensive products.
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

-- Show the 3 cheapest products.
SELECT * FROM products
ORDER BY price ASC
LIMIT 3;

-- Show the latest 10 orders.
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 10;
