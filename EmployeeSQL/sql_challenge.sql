DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
  dept_no character varying (45)  NOT NULL,
  dept_name character varying(45) NOT NULL,
  PRIMARY KEY (dept_no)
);
CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(45) NOT NULL,
  PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
  dept_no character varying(45) NOT NULL,
  emp_no integer NOT NULL,
  PRIMARY KEY (dept_no)
);
CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id interger NOT NULL,
	birth_date date NOT NULL,
	first_name character varying(75) NOT NULL,
	last_name character varying(75) NOT NULL,
	sex character varying (5) NOT NULL,
    birth_date date NOT NULL,
);
CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary interger NOT NULL
);
CREATE TABLE titles (
  title_id interger NOT NULL, 
  title character varying (50) NOT NULL
);
