-- Active: 1711521837540@@127.0.0.1@5432@company_db

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY NOT NULL,
    department_name VARCHAR(50) NOT NULL
)

SELECT * FROM departments

ALTER TABLE departments
ADD constraint unique_departments_department_name UNIQUE (department_name);

INSERT INTO
    departments (department_name)
VALUES ('Engineering'),
    ('Marketing'),
    ('Finance');

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY UNIQUE NOT NULL,
    employee_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    department_id INTEGER REFERENCES departments (department_id),
    salary NUMERIC NOT NULL,
    status VARCHAR(20)
)

DROP TABLE employees

INSERT INTO
    employees (
        employee_name,
        age,
        email,
        department_id,
        salary,
        status
    )
VALUES (
        'Alice',
        30,
        'alice@example.com',
        1,
        60000,
        NULL
    ),
    (
        'Bob',
        35,
        'bob@example.net',
        2,
        65000,
        NULL
    ),
    (
        'Charlie',
        28,
        'charlie@google.com',
        1,
        55000,
        NULL
    ),
    (
        'David',
        33,
        'david@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Eve',
        31,
        'eve@example.net',
        3,
        58000,
        NULL
    ),
    (
        'Frank',
        29,
        'frank@example.com',
        1,
        59000,
        NULL
    ),
    (
        'Grace',
        34,
        'grace@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Henry',
        32,
        'henry@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Ivy',
        27,
        'ivy@gmail.com',
        1,
        56000,
        NULL
    ),
    (
        'Jack',
        36,
        'jack@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Karen',
        29,
        'karen@gmail.com',
        3,
        60000,
        NULL
    ),
    (
        'Liam',
        33,
        'liam@gmail.com',
        1,
        59000,
        NULL
    ),
    (
        'Mia',
        31,
        'mia@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Nora',
        28,
        'nora@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Oliver',
        35,
        'oliver@example.net',
        1,
        61000,
        NULL
    ),
    (
        'Penelope',
        30,
        'penelope@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Quinn',
        32,
        'quinn@google.com',
        3,
        59000,
        NULL
    ),
    (
        'Rachel',
        27,
        'rachel@gmail.com',
        1,
        55000,
        NULL
    ),
    (
        'Sam',
        34,
        'sam@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Taylor',
        31,
        'taylor@yahoo.com',
        3,
        58000,
        NULL
    );

    
--Query_01
SELECT
    employee_id,
    employee_name,
    age,
    email,
    department_id,
    salary,
    COALESCE(status, '') as status
FROM employees
WHERE
    salary > 60000

--Query_02
SELECT employee_name FROM employees LIMIT 2 OFFSET 2

--Query_03
SELECT round(avg(age), 2) as average_age FROM employees

--Query_04
SELECT *
FROM employees
WHERE
    email LIKE '%example.com%'
    OR email LIKE '%http://example.com/%'
    OR email LIKE '%example.net%'
    OR email LIKE '%http://example.net/%'
    OR email LIKE '%google.com%'
    OR email LIKE '%http://google.com/%';

--Query 5:
SELECT employee_name
FROM employees
    JOIN departments USING (department_id)
WHERE
    department_name = 'Engineering';

--Query 6:
UPDATE employees
SET
    status = 'Promoted'
WHERE
    salary = (
        SELECT max(salary) as highest_salary
        FROM employees
    );

--Query 7:
SELECT department_name, avg(salary)
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY department_name ASC;