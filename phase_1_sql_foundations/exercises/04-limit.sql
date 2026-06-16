-- Top 5 most expensive expenses
SELECT * FROM expenses
ORDER BY price DESC
LIMIT 5;

-- Top 3 cheapest expenses
SELECT * FROM expenses
ORDER BY price ASC
LIMIT 5;
