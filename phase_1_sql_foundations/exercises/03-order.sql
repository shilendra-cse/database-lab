-- Most expensive expense first
SELECT * FROM expenses
ORDER BY price DESC;

-- Cheapest expense first
SELECT * FROM expenses
ORDER BY price ASC;

-- Latest expense first
SELECT * FROM expenses
ORDER BY expense_date DESC;

-- Oldest expense first
SELECT * FROM expenses
ORDER BY expense_date ASC;
