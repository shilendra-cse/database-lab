-- Expenses costing more than 1000
SELECT * FROM expenses
  WHERE price>1000;

-- Expenses costing less than 500
SELECT * FROM expenses
  WHERE price<500;

-- Expenses in category FOOD
SELECT * FROM expenses
JOIN categories AS cat
  ON category_id = cat.id
    WHERE cat.title = 'FOOD';

-- Expenses after 2026-06-07
SELECT * FROM expenses
  WHERE expense_date > '2026-06-07';

-- Expenses between 500 and 1500
SELECT * FROM expenses
  WHERE price >= 500 AND price <= 1500;
