--Create tables 
CREATE TABLE department(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) UNIQUE
);

CREATE TABLE  dept_employee(
	emp_no int PRIMARY KEY,
	dept_no VARCHAR(10) NOT NULL,
	CONSTRAINT dept_no_
		FOREIGN KEY(dept_no)
			REFERENCES department(dept_no)
);

CREATE TABLE dept_manager(
	dept_no_ VARCHAR(10) NOT NULL,
	emp_no int UNIQUE,
	CONSTRAINT emp_no_
		FOREIGN KEY(emp_no)
			REFERENCES dept_employee(emp_no)
);

CREATE TABLE title(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(25)
);

CREATE TABLE employees(
	emp_no_ int PRIMARY KEY,
	title_id VARCHAR(10),
	CONSTRAINT title_id_
		FOREIGN KEY(title_id)
			REFERENCES title(title_id),
	birth_date date,
	first_name VARCHAR(30),
	last_name VARCHAR (30),
	sex VARCHAR(5), 
	hire_date date
);

CREATE TABLE Salary(
	emp_no_ int PRIMARY KEY,
	salary int
);

--Read in csv files to tables
SELECT * FROM department;
SELECT * FROM salary;
SELECT * FROM title;