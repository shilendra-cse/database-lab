-- How many users exist?
SELECT count(*) FROM users;

-- How many products exist?
SELECT count(*) FROM products;

-- How many orders exist?
SELECT count(*) FROM orders;

-- What is the total value of all products?
SELECT sum(price) FROM products;

-- What is the average product price?
SELECT avg(price) FROM products;

-- What is the most expensive product?
SELECT MAX(price) FROM products;

-- What is the cheapest product?
SELECT MIN(price) FROM products;
