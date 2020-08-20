SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT last_name FROM employees ORDER BY last_name asc;
SELECT DISTINCT manager_id FROM employees;
SELECT employee_id FROM employees WHERE manager_id = 100;

SELECT country_name FROM countries;
SELECT city, country_id FROM locations;
SELECT region_name AS 'Region' FROM regions;
SELECT job_title FROM jobs ORDER BY job_title ASC;
SELECT DISTINCT location_id FROM departments;

ALTER TABLE countries ADD test_table int; -- adds a new column to a selected table

SELECT last_name FROM employees WHERE manager_id = 124 AND salary > 3000 ;-- combining 2 conditions: "All employees of manager 124 with salary > 3000."

SELECT country_id AS "Länder" FROM countries; -- remaning the column of a table

SELECT AVG(salary) FROM employees; -- average value of numeric column

SELECT last_name, first_name FROM employees WHERE salary BETWEEN 2000 AND 3000; -- filter the result within a certain range e.g a certain salary range

SELECT last_name,
    CASE
        WHEN salary > 10000 THEN 'extrem gut bezahlte Leute'
        WHEN salary > 5000 THEN 'gut bezahlte Leute'
        ELSE 'normales Gehalt'
    END
FROM employees; -- With CASE you can create different outputs.

SELECT COUNT(commission_pct) AS 'Anzahl Provisionen' FROM employees; -- counts all rows that are not null

CREATE TABLE test_table (
    column1 varchar(10),
    column2 varchar(10),
    column3 varchar(10)
); -- creating a new table

INSERT INTO test_table (column1, column2, column3)
    VALUES
        ('Apfel', 'Gurke', 'Käse');

INSERT INTO test_table (column1, column2, column3)
    VALUES
        ('Birne', 'Karotte', 'Milch'); -- insert content per row

DELETE FROM test_table WHERE column1 = 'Apfel'; -- deletes the whole row if there is a matching content

SELECT department_id, COUNT(*) FROM employees GROUP BY department_id; -- only in combination with COUNT to aggregate data, group results

SELECT department_id, COUNT(*) FROM employees GROUP BY department_id HAVING COUNT(*) > 1; -- combining aggregating and conditions (WHERE is not working) --> "All department with more that 1 employees."

SELECT commission_pct FROM employees WHERE commission_pct IS NULL; -- IS NULL or IS NOT NULL

SELECT first_name FROM employees WHERE first_name LIKE 'E%'; -- search for a specific pattern

SELECT salary FROM employees ORDER BY salary desc LIMIT 3; -- limit results e.g. top 3 salaries

SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees; -- min and max values

SELECT manager_id FROM employees WHERE manager_id = 100 OR department_id = 110; -- selection with OR condition

SELECT ROUND(salary, 1) FROM employees; -- round integers to defined decimal numbers

SELECT DISTINCT commission_pct FROM employees; -- returns all unique values (Duplikate entfernen)

SELECT SUM(salary) FROM employees; -- sum of values (does not count the number of lines!)

UPDATE test_table SET column1 = 'ApfelNEU' WHERE column1 = 'Apfel'; -- updates content of a specific row

WITH temporary_department_id (Vorname, Nachname) AS (
    SELECT first_name, last_name
    FROM employees )
SELECT *
FROM temporary_department_id;  -- store the result of a query in a temporary table




