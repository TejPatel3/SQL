--1. write a SQL query to find Employees who have the biggest salary in their Department
SELECT 
	emp_name,dept_name,salary 
FROM
	Employees e 
JOIN
	Department d 
ON 
	e.dept_id=d.dept_id 
WHERE
	salary IN (SELECT MAX(salary) FROM Employees GROUP BY dept_id)


--2. write a SQL query to find Departments that have less than 3 people in it
SELECT 
	dept_name,COUNT(emp_name) "NO of Employees"  
FROM
	Employees e 
JOIN
	Department d 
ON 
	e.dept_id=d.dept_id  
GROUP BY
	dept_name 
HAVING
	COUNT(emp_name) <3



--3. write a SQL query to find All Department along with the number of people there
SELECT
	dept_name,COUNT(emp_name) "NO of Employees"  
FROM
	Employees e 
JOIN
	Department d 
ON 
	e.dept_id=d.dept_id  
GROUP BY 
	dept_name 



--4. write a SQL query to find All Department along with the total salary there
SELECT
	dept_name,SUM(salary)"Total Salary" 
FROM
	Employees e JOIN Department d 
ON 
	e.dept_id=d.dept_id 
GROUP BY
	dept_name


