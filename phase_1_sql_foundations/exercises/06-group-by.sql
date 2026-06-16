-- Total spending per category
SELECT SUM(price) FROM expenses
GROUP BY category_id;

-- Number of expenses per category
SELECT COUNT(id) FROM expenses
GROUP BY category_id;

-- Average expense per category
SELECT AVG(price) FROM expenses
GROUP BY category_id;

-- Highest expense per category
SELECT MAX(price) FROM expenses
GROUP BY category_id;
