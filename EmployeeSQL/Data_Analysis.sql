-- Q1: List the following details of each employee: 

-- employee number, last name, first name, gender, and salary.

CREATE VIEW Question1 AS

	SELECT 
		Employees.emp_no AS "Employee Number",
		Employees.first_name AS "First Name",
		Employees.last_name AS "Last Name",	
		Employees.gender AS "Gender", 
		Salaries.salary As "Salary"
	From 
		Employees
	FULL OUTER JOIN
		Salaries 
		on Employees.emp_no = Salaries.emp_no;
------------------------------------------------------------------------------
-- Q2: List employees who were hired in 1986

CREATE VIEW Question2 AS

	SELECT 
		emp_no as "Employee Number", 
		first_name as "First Name", 
		last_name as "Last Name", 
		hire_date as "Hire Date"
	FROM
		Employees
	WHERE 
		extract(year from hire_date)=1986;
------------------------------------------------------------------------------
-- Q3 List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

CREATE VIEW Question3 AS

	SELECT 
		Department_Manager.dept_no As "Department Number",
		Departments.dept_name As "Department Name",
		Department_Manager.emp_no As "Manager Employee Number",
		Employees.first_name As "First Name",
		Employees.last_name AS "Last Name",
		Department_Manager.from_date As "From",
		Department_Manager.to_date As "To"
	FROM
		Department_Manager
	LEFT JOIN
		Departments
		on Department_Manager.dept_no = Departments.dept_no
	LEFT JOIN
		Employees
		on Employees.emp_no = Department_Manager.emp_no;
	
------------------------------------------------------------------------------
-- Q4: List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

CREATE VIEW Question4 AS

	SELECT 
		Employees.emp_no As "Employee Number",
		Departments.dept_name As "Department",
		Employees.first_name As "First Name",
		Employees.last_name As "Last Name"	
	FROM
		Department_Employee	
	FULL OUTER JOIN
		Employees		
		on Department_Employee.emp_no = Employees.emp_no
	LEFT JOIN
		Departments
		on Departments.dept_no = Department_Employee.dept_no;

------------------------------------------------------------------------------
-- Q5:List all employees whose first name is "Hercules" and last names 
-- begin with "B."

CREATE VIEW Question5 AS

SELECT 
	emp_no As "Employee Number",
	first_name As "First Name", 
	last_name As "Last Name"
FROM
 	Employees
WHERE
	first_name = 'Hercules' AND last_name lIKE 'B%';
	
------------------------------------------------------------------------------
-- Q6: List all employees in the Sales department, 
-- including their employee number, last name, first name,and department name.

CREATE VIEW Question6 As 

	SELECT 
		Employees.emp_no As "Employee Number",
		Departments.dept_name As "Department",
		Employees.first_name As "Employee First Name",
		Employees.last_name As "Employee Last Name"
	FROM
		Department_Employee	
	JOIN
		Employees		
		on Department_Employee.emp_no = Employees.emp_no
	JOIN
		Departments
		on Departments.dept_no = Department_Employee.dept_no
	WHERE
		Departments.dept_name = 'Sales';
------------------------------------------------------------------------------
-- Q7: List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name,and department name.

CREATE VIEW Question7 AS

	SELECT 
		Employees.emp_no AS "Employee Name",
		Departments.dept_name AS "Department",
		Employees.first_name As "First Name",
		Employees.last_name As "Last Name"
	FROM
		Department_Employee	
	JOIN
		Employees		
		on Department_Employee.emp_no = Employees.emp_no
	JOIN
		Departments
		on Departments.dept_no = Department_Employee.dept_no
	WHERE
		Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';
-----------------------------------------------------------------------------
-- Q8: In descending order, list the frequency count of employee 
--     last names, i.e., how many employees share each last name.

CREATE VIEW Question8 As

	SELECT 
		last_name As "Last Name",
		count(*) AS "Frequency"
	From 
		Employees
	GROUP BY
		last_name
	ORDER BY 
		"Frequency"
		Desc;
------------------------------------------------------------------------------
--Update emp_no 499942 to my name:

UPDATE 
	employees 
SET 
	birth_date = '1990-12-20',
	first_name = 'Sahar',
	last_name = 'Alaei Varnoosfaderani',
	hire_date = '2012-12-11'
WHERE 
	emp_no = 499942
