

--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT * FROM employees;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >='1986-01-01'
AND hire_date <='1986-12-31';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT depmgr.dept_no, dept.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS depmgr
JOIN departments AS dept
ON depmgr.dept_no = dept.dept_no
JOIN employees AS e
ON depmgr.emp_no = e.emp_no;

---4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT dept.dept_no, e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e 
JOIN dept_emp
ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept
ON dept.dept_no = dept_emp.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT * FROM employees;


SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e 
JOIN dept_emp
ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept
ON dept_emp.dept_no = dept.dept_no
WHERE dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e 
JOIN dept_emp
ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept
ON dept_emp.dept_no = dept.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT * FROM employees;

SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees 
GROUP BY last_name
ORDER BY "last_name_count" DESC;