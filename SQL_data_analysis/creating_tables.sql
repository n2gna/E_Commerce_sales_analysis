
-- creating tables

CREATE TABLE category(
category_id INT PRIMARY KEY,
category_name VARCHAR(25)
);

CREATE TABLE sellers (
seller_id INT PRIMARY KEY,
seller_name VARCHAR(30),
origin VARCHAR(10)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(25),
state VARCHAR(25),
address VARCHAR(5) DEFAULT ('xxxx')
);

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(30),
price FLOAT,
cogs FLOAT,
category_id INT REFERENCES category(category_id)
);


CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT REFERENCES customers(customer_id),
seller_id INT REFERENCES sellers(seller_id),
order_status VARCHAR(50)
);

CREATE TABLE order_items(
order_item_id INT PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
product_id INT REFERENCES products(product_id),
quantity INT,
price_per_unit FLOAT
);

CREATE TABLE inventory(
inventory_id INT PRIMARY KEY,
product_id INT REFERENCES products(product_id),
stock INT,
warehouse_id INT,
last_stock_date DATE
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
payment_date DATE,
payment_status VARCHAR(20)
);

CREATE TABLE shipping(
shipping_id INT PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(15),
delivery_status VARCHAR(15)
);


--------------------------



