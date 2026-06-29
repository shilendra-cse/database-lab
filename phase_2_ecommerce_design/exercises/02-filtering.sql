-- Show all products costing more than ₹1000.
SELECT * FROM products
WHERE price>1000;

-- Show all products costing less than ₹500.
SELECT * FROM products
WHERE price<500;

-- Show all orders that are currently PENDING.
SELECT * FROM orders
WHERE status='PENDING';

-- Show all orders that were placed after a specific date.
SELECT * FROM orders
WHERE order_date>'2026-06-25';

-- Show all orders placed between two dates.
SELECT * FROM orders
WHERE order_date>'2026-06-25' AND order_date>'2026-06-28';
