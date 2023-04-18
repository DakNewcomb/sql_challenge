-- Create views for data analysis
-- 1. List employee #, last name, first name, sex, and salary for each employee.
CREATE VIEW emp_salary AS
SELECT employees.emp_no, employees.last_name, employees.first_name,
	employees.sex, salary.salary
	FROM employees
		INNER JOIN salary
		ON (employees.emp_no = salary.emp_no)	
SELECT * FROM emp_salary;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW hires_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
			--Where .. Between for dates from https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-between/
SELECT * FROM hires_1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW managers AS
SELECT dept_manager.dept_no, depts.dept_name, dept_manager.emp_no,
	employees.last_name, employees.first_name
	FROM dept_manager 
		JOIN depts
		ON (dept_manager.dept_no = depts.dept_no)
			JOIN employees
			ON (dept_manager.emp_no = employees.emp_no);
SELECT * FROM managers;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW emp_dept AS
SELECT dept_emp.dept_no, depts.dept_name, dept_emp.emp_no, 
	employees.last_name, employees.first_name
	FROM dept_emp
		JOIN depts
		ON (dept_emp.dept_no = depts.dept_no)
			JOIN employees
			ON (dept_emp.emp_no = employees.emp_no);
SELECT * FROM emp_dept;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW herc_emp AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
SELECT * FROM herc_emp;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW sales_emp AS
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM depts
	JOIN dept_emp
	ON (depts.dept_no = dept_emp.dept_no)
		JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
		WHERE dept_name = 'Sales';
SELECT * FROM sales_emp;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW dev_sales_emp AS
SELECT depts.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM depts
	JOIN dept_emp
	ON (depts.dept_no = dept_emp.dept_no)
		JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
		WHERE dept_name = 'Sales' OR dept_name = 'Development';
SELECT * FROM dev_sales_emp;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW name_counts AS
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
SELECT * FROM name_counts;
