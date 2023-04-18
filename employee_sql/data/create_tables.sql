CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);
SELECT * FROM employees;

CREATE TABLE depts (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);
SELECT * FROM depts;

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES depts (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no int UNIQUE,
	FOREIGN KEY (dept_no) REFERENCES depts(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager;

CREATE TABLE salary(
	emp_no int PRIMARY KEY,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salary;

CREATE TABLE title(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(25)
);

SELECT * FROM title;


