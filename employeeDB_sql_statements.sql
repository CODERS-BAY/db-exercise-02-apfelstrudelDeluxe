SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT last_name FROM employees ORDER BY last_name asc;
SELECT DISTINCT manager_id FROM employees;
SELECT employee_id FROM employees WHERE manager_id = 100;
SELECT count(last_name) FROM employees GROUP BY manager_id;

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

SELECT first_name FROM employees WHERE first_name LIKE ('E%'); -- search for a specific pattern, only works for CHARS
SELECT first_name FROM employees WHERE first_name LIKE ('s_e%');

SELECT salary FROM employees ORDER BY salary desc LIMIT 3; -- limit results e.g. top 3 salaries

SELECT MAX(salary) FROM employees; -- who has the max. salary?
SELECT MIN(salary) FROM employees; -- min and max values

SELECT manager_id FROM employees WHERE manager_id = 100 OR department_id = 110; -- selection with OR condition

SELECT ROUND(salary,1) FROM employees; -- round integers to defined decimal numbers
SELECT ROUND(salary) FROM employees;

SELECT DISTINCT commission_pct FROM employees; -- returns all unique values (Duplikate entfernen)

SELECT SUM(salary)FROM employees; -- sum of values (does not count the number of lines!)
SELECT SUM(salary) FROM employees GROUP BY job_id ORDER BY sum(salary) DESC;

UPDATE test_table SET column1 = 'ApfelNEU' WHERE column1 = 'Apfel'; -- updates content of a specific row

WITH temporary_department_id (Vorname, Nachname) AS (
    SELECT first_name, last_name
    FROM employees )
SELECT *
FROM temporary_department_id;  -- store the result of a query in a temporary table

SELECT CONCAT(first_name, ' ', last_name) AS 'Name Mitarbeiter' FROM employees;
SELECT CONCAT_WS(' ', first_name, last_name) FROM employees; -- ev. more practical, if you want to combine more columns

SELECT UCASE(first_name) FROM employees; -- change output to upper or lower case
SELECT LCASE(first_name) FROM employees;

SELECT CONCAT(UCASE(first_name), ' ', LCASE(last_name)) AS 'Name Mitarbeiter' FROM employees; -- combining queries in one column

SELECT LENGTH(first_name), first_name FROM employees;

SELECT NOW() FROM employees; -- current time e.g. as time stamp

SELECT first_name, last_name, manager_id FROM employees WHERE manager_id <> 103 AND manager_id > 102;
SELECT first_name, last_name, manager_id FROM employees WHERE manager_id <> 103 OR manager_id > 102;

SELECT first_name, last_name FROM employees
UNION
SELECT job_id, job_title FROM jobs; -- unites the results of many tables


-- more exercises --
-----------------------
SELECT first_name, last_name FROM employees WHERE first_name LIKE ('K%');
SELECT first_name, last_name FROM employees WHERE first_name <> 'Peter' OR first_name <> 'Eleni';
SELECT first_name, last_name, salary FROM employees WHERE salary > 10000;
SELECT department_name FROM departments WHERE location_id = 1700;
SELECT last_name, phone_number FROM employees WHERE phone_number LIKE ('%65%');


-- JOIN (wie SVERWEIS)
-----------------------
SELECT employees.last_name, departments.department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

SELECT departments.department_name, employees.last_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

SELECT departments.department_name, locations.postal_code, locations.city, countries.country_name
FROM departments
JOIN locations ON departments.location_id = locations.location_id
JOIN countries ON locations.country_id = countries.country_id; -- Wie beim SVERWEIS, Reihenfolge der Abfrage beachten!

SELECT d.department_name, l.postal_code, l.city, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id; -- kürzere Schreibweise: Variablen für Tabellennamen vergeben (initialisieren) und gleich ausführen.

SELECT e.first_name, e.last_name, m.last_name AS 'Manager'
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;
-- suche in Zeile manager_id die passende employer_id und gebe last_name aus


-- JOIN EXERCISES --
SELECT countries.country_name, regions.region_name
FROM countries
JOIN regions ON countries.region_id = regions.region_id;

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

SELECT job_history.start_date, job_history.end_date, employees.first_name, employees.last_name
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id;

SELECT job_history.start_date, job_history.end_date, jobs.job_title
FROM job_history
JOIN jobs ON job_history.job_id = jobs.job_id;

SELECT employees.first_name, employees.last_name, job_history.start_date, job_history.end_date, jobs.job_title
FROM employees
JOIN job_history ON employees.employee_id = job_history.employee_id
JOIN jobs ON job_history.job_id = jobs.job_id;

