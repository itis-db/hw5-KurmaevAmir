CREATE TABLE temperature_logs (
    id SERIAL PRIMARY KEY,
    log_time TIMESTAMP,
    temperature DECIMAL(5, 2)
);

INSERT INTO temperature_logs (log_time, temperature)
VALUES ('2025-06-12 08:00:00', 20),
       ('2025-06-12 12:00:00', 25),
       ('2025-06-12 18:00:00', 23),
       ('2025-06-13 08:00:00', 20),
       ('2025-06-13 12:00:00', 24),
       ('2025-06-13 18:00:00', 23),
       ('2025-06-14 08:00:00', 21),
       ('2025-06-14 12:00:00', 23),
       ('2025-06-14 18:00:00', 20),
       ('2025-06-15 08:00:00', 19);

SELECT log_time, temperature, AVG(temperature) OVER (ORDER BY log_time ROWS BETWEEN 2
    PRECEDING AND CURRENT ROW) as moving_avg
FROM temperature_logs;