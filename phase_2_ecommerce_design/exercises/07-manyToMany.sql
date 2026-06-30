-- Show every product in a specific order.
SELECT orders.id as orderid, orders.status, products.id as productid, products.name,order_items.quantity, order_items.unit_price as itemprice
  FROM order_items
JOIN orders
  ON orders.id = order_items.orderid
JOIN products
  ON products.id = order_items.productid
WHERE orders.id=1;

-- Show all orders containing a specific product.
SELECT p.id, p.name, o_it.quantity, o.status, o.order_date, o.id as order_id, o_it.unit_price
  FROM order_items as o_it
JOIN orders as o
  ON o.id = o_it.orderid
JOIN products as p
  ON p.id = o_it.productid
WHERE p.name = 'MacBook Air';

-- Show the quantity ordered for every product in an order.
SELECT p.name, o.id as order_id, o_it.quantity
  FROM order_items as o_it
JOIN orders as o
  ON o.id = o_it.orderid
JOIN products as p
  ON p.id = o_it.productid
WHERE o.id=1;

-- Show the unit price stored for every purchased product.
SELECT p.name, o_it.unit_price
  FROM order_items as o_it
JOIN products as p
  ON o_it.productid = p.id;
