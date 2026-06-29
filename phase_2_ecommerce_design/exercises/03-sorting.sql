-- Show products from highest price to lowest.
SELECT * FROM products
ORDER BY PRICE ASC;

-- Show products from lowest price to highest.
SELECT * FROM products
ORDER BY PRICE DESC;

-- Show the latest orders first.
SELECT * FROM orders
ORDER BY order_date DESC;

-- Show the oldest orders first.
SELECT * FROM orders
ORDER BY order_date ASC;
