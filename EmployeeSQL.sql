--List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees 
	LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	dept_manager.dept_no, 
	departments.dept_name, 
	dept_manager.emp_no, 
	employees.last_name, 
	employees.first_name
FROM dept_manager
	LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no
	LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees
	LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name, 
	last_name, 
	sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    employees.emp_no, 
    employees.last_name, 
    employees.first_name, 
    departments.dept_name
FROM employees
    LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
    LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.first_name, 
    e.last_name, 
    e.emp_no, 
    e.hire_date, 
    d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
	last_name, 
	COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;