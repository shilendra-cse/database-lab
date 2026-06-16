CREATE DATABASE expense_tracker;

CREATE TABLE categories (
    id INT PRIMARY KEY,
    title VARCHAR(20),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE expenses (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    category_id INT,
    expense_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES categories(id)
);
