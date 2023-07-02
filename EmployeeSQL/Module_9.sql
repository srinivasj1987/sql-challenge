select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

1. List the employee number, last name, first name, sex, and salary of each employee.

select emp.emp_no,emp.last_name,emp.first_name,emp.sex,sal.salary from employees as emp
JOIN salaries AS sal ON
sal.emp_no = emp.emp_no
ORDER BY emp.emp_no;

2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date 
from employees 
where EXTRACT(YEAR from hire_date) = 1986
ORDER BY hire_date;

3. List the manager of each department along with their department number, 
department name, employee number, last name, and first name.

SELECT emp.first_name,emp.last_name,dm.emp_no,dm.dept_no,dept.dept_name 
from employees as emp
JOIN dept_manager as dm ON
dm.emp_no = emp.emp_no
JOIN departments as dept ON
dm.dept_no = dept.dept_no;

4.List the department number for each employee along with that employee’s employee number, 
last name, first name, and department name.

select dept.dept_no,emp.emp_no,emp.last_name,emp.first_name,dept.dept_name 
from employees as emp
JOIN dept_emp as de ON
de.emp_no = emp.emp_no
JOIN departments as dept ON
dept.dept_no = de.dept_no
ORDER by dept.dept_no;

5.List first name, last name, and sex of each employee whose
first name is Hercules and whose last name begins with the letter B.

select first_name, last_name,sex from employees
WHERE first_name LIKE 'Hercules' and last_name LIKE 'B%'
ORDER BY last_name;

6.List each employee in the Sales department, including their employee number, last name, and first name.

select emp_no, first_name,last_name from employees where emp_no IN 
(select emp_no from dept_emp where dept_no IN 
(SELECT dept_no from departments where dept_name = 'Sales')
)
ORDER BY emp_no;

7.List each employee in the Sales and Development departments, 
including their employee number, last name, first name, and department name.

select emp.emp_no,last_name,first_name, dept_name from employees as emp
JOIN dept_emp as de ON
de.emp_no = emp.emp_no
JOIN departments as dept ON
dept.dept_no = de.dept_no
WHERE dept.dept_name IN ('Sales','Development')
ORDER BY emp.emp_no;

8.List the frequency counts, in descending order, 
of all the employee last names (that is, how many employees share each last name).

select last_name, COUNT(*) AS "No_share_last_name" from employees
group by last_name
ORDER BY "No_share_last_name" DESC;


