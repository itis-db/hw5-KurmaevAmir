CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO products (category, price)
VALUES ('Electronics', 89999.99),
       ('Electronics', 35000.50),
       ('Books', 1499.99),
       ('Books', 2499.99),
       ('Clothing', 900.99),
       ('Clothing', 450.99),
       ('Electronics', 12000.00),
       ('Books', 999.99),
       ('Clothing', 1200.00),
       ('Electronics', 300000.00);

SELECT id, category, price, AVG(price) OVER (PARTITION BY category) AS deviation_from_avg
FROM products;