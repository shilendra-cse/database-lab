-- Total money spent
SELECT SUM(price) as total_spent FROM expenses;

-- Average expense
SELECT AVG(price) as avg_expense_price FROM expenses;

-- Highest expense
SELECT MAX(price) FROM expenses;

-- Lowest expense
SELECT MIN(price) FROM expenses;

-- Number of expenses
SELECT COUNT(id) FROM expenses;
