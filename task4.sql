CREATE TABLE project_tasks
(
    id         SERIAL PRIMARY KEY,
    task_id    INTEGER,
    project_id INTEGER,
    start_date DATE
);

INSERT INTO project_tasks(task_id, project_id, start_date)
VALUES (1, 1, '2025-06-01'),
       (2, 1, '2025-06-10'),
       (3, 2, '2025-07-01'),
       (4, 1, '2025-06-15'),
       (5, 2, '2025-07-10'),
       (6, 3, '2025-08-01'),
       (7, 3, '2025-08-05'),
       (8, 2, '2025-06-25'),
       (9, 3, '2025-07-20'),
       (10, 1, '2025-06-01');

SELECT task_id, project_id, start_date,
       FIRST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date) as first_task_date,
       LAST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_task_date
FROM project_tasks;