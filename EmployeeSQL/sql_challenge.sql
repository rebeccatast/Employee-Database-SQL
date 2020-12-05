--Create Tables
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
  dept_no character varying (45)  NOT NULL,
  dept_name character varying(45) NOT NULL
);
CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(45) NOT NULL
);
CREATE TABLE dept_manager (
  dept_no character varying(45) NOT NULL,
  emp_no integer NOT NULL
);
CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id character varying (50) NOT NULL,
	birth_date date NOT NULL,
	first_name character varying(75) NOT NULL,
	last_name character varying(75) NOT NULL,
	sex character varying (5) NOT NULL,
    hire_date date NOT NULL
);
CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL
);
CREATE TABLE titles (
  title_id character varying (50) NOT NULL, 
  title character varying (50) NOT NULL
);

--Details of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
	ON(emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

--Hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Manager of each department
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees as e
		ON (dm.emp_no = e.emp_no)
ORDER BY dm.dept_no;

-- Department of each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

--Employee named Hercules, last name starts with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name = 'B%';

--Sales department employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name ='Sales'
ORDER BY e.emp_no;

--Sales and Development employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no; 

--Frequency count of employee last names, descending order
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


