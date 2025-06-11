CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO transactions (date, amount)
VALUES ('2024-01-01', 100.00),
       ('2024-02-01', 200.00),
       ('2024-03-01', 150.00),
       ('2024-04-01', 50.00),
       ('2024-05-01', 300.00),
       ('2024-06-01', 100.00),
       ('2024-07-01', 250.00),
       ('2024-08-01', 400.00),
       ('2024-09-01', 200.00),
       ('2024-10-01', 150.00);

SELECT date, amount, SUM(amount) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
FROM transactions;
