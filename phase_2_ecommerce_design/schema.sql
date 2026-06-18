CREATE DATABASE ecommerce;

CREATE TABLE users(
  id INT PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE products(
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price INT NOT NULL CHECK (price>0),
  createdAt TIMESTAMP NOT NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TYPE order_status_enum as enum ('PENDING', 'PAID', 'SHIPPED', 'DELIVERED', 'CANCELED');

CREATE TABLE orders(
  id INT PRIMARY KEY,
  userId INT NOT NULL REFERENCES users(id),
  order_date DATE NOT NULL,
  status order_status_enum NOT NULL DEFAULT 'PENDING',
  total_price INT NOT NULL CHECK (total_price>0),
  createdAt TIMESTAMP NOT NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE order_items(
  id INT PRIMARY KEY,
  orderId INT NOT NULL REFERENCES orders(id),
  productId INT NOT NULL REFERENCES products(id),
  unit_price INT NOT NULL CHECK (unit_price>0),
  quantity INT NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW(),
  yupdatedAt TIMESTAMP NOT NULL DEFAULT NOW()
);
