--1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
SELECT 
	name AS "Salesman Name",
	cust_name AS "Customer Name",
	s.city AS "City"
FROM  
	salesman2 s
JOIN 
	customer2 c 
ON 
	s.salesman_id=c.salesman_id 
WHERE 
	s.city = c.city


--2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
SELECT
	ord_no AS "Order No",
	purch_amt AS "Order Amount",
	cust_name AS "Customer Name",
	city 
FROM 
	orders2 o
JOIN 
	customer2 c 
ON 
	o.customer_id = c.customer_id 
WHERE 
	purch_amt BETWEEN 500 AND 2000


--3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission-
SELECT 
	cust_name AS "Customer Name",
	s.city AS "City",
	name AS "Salesman Name",
	commission  AS "Commission"
FROM 
	salesman2 s
JOIN 
	customer2 c
ON 
	s.salesman_id = c.salesman_id


--4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.
SELECT 
	cust_name,
	c.city,
	name,
	commission  
FROM 
	customer2 c
JOIN 
	salesman2 s
ON 
	s.salesman_id = c.salesman_id 
WHERE 
	commission > 0.12


--5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission
SELECT 
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	name AS "Salesman Name",
	s.city AS "Salesman City",
	commission AS "Commission"
FROM 
	customer2 c
JOIN 
	salesman2 s
ON 
	c.salesman_id = s.salesman_id 
WHERE 
	c.city != s.city AND commission>0.12


--6. write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT 
	ord_no AS "Order No",
	ord_date AS "Order Date",
	purch_amt AS "Order Amount",
	cust_name AS "Customer Name",
	grade AS "Grade",
	name AS "Salesman Name",
	commission AS "Commission" 
FROM 
	salesman2 s
JOIN 
	customer2 c
ON 
	s.salesman_id = c.salesman_id 
JOIN 
	orders2 o
ON 
	o.salesman_id = c.salesman_id


--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
SELECT 
	s.salesman_id AS "Salesman ID",
	name AS "Salesman Name",
	s.city AS "Salesman City",
	commission AS "Commission",
	c.customer_id AS "Customer ID",
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	grade AS "Grade",
	ord_no AS "Order No",
	purch_amt AS "Order Amount",
	ord_date AS "Order Date" 
FROM 
	salesman2  s 
JOIN 
	customer2  c 
ON 
	s.salesman_id = c.salesman_id 
JOIN 
	orders2  o 
ON 
	o.salesman_id = c.salesman_id



--8. write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT 
	cust_name AS "Customer Name",	
	c.city AS "Customer City",	
	grade AS "Grade",name AS "Salesman Name",	
	s.city AS "Salesman City" 
FROM 
	salesman2 AS s 
JOIN 
	customer2 as c 
ON 
	s.salesman_id = c.salesman_id 
ORDER BY 
	customer_id


--9. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. 
SELECT 
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	grade AS "Grade",
	name AS "Salesman Name",
	s.city AS "Salesman City"
FROM 
	salesman2  s 
JOIN 
	customer2  c 
ON 
	s.salesman_id = c.salesman_id 
WHERE 
	grade < 300
ORDER BY 
	customer_id



--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not
SELECT 
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	ord_no AS "Order No",
	ord_date AS "Order Date" ,
	purch_amt AS "Order Amount"
FROM 
	customer2  c 
LEFT JOIN 
	orders2  o
ON 
	c.customer_id = o.customer_id 
ORDER BY 
	ord_date


--11. Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves
SELECT 
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	ord_no AS "Order No",
	ord_date AS "Order Date" ,
	purch_amt AS "Order Amount",
	name AS "Salesman Name",
	commission AS "Commission"
FROM 
	customer2  c 
LEFT JOIN 
	orders2  o 
ON 
	c.customer_id = o.customer_id 
LEFT JOIN 
	salesman2  s 
ON 
	s.salesman_id = c.salesman_id


--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers
SELECT 
	name AS "Salesman Name",
	s.city AS "Salesman City",
	c.customer_id AS "Customer ID",
	cust_name AS "Customer Name",
	c.city AS "Customer City"
FROM 
	salesman2  s  
LEFT JOIN 
	customer2 c 
ON 
	s.salesman_id = c.salesman_id 
ORDER BY 
	name

--13. write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT 
	name AS "Salesman Name",
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	grade AS "Grade",
	ord_no AS "Order No",
	ord_date AS "Order Date", 
	purch_amt AS "Order Amount"
FROM 
	salesman2 AS s 
LEFT JOIN 
	customer2 as c 
ON 
	s.salesman_id = c.salesman_id 
LEFT JOIN 
	orders2 AS o 
ON 
	o.salesman_id = c.salesman_id


--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customers. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	name AS "Salesman Name",
	s.city AS "Salesman City",
	grade AS "Grade",
	ord_no AS "Order No",
	purch_amt AS "Order Amount",
	ord_date AS "Order Date" 
FROM 
	salesman2 s 
LEFT JOIN 
	customer2 c 
ON 
	s.salesman_id = c.salesman_id 
LEFT JOIN 
	orders2  o 
ON 
	o.salesman_id = c.salesman_id 
WHERE 
	purch_amt >= 2000 and grade IS NOT NULL

--15. Write a SQL statement to generate a list of all the salesmen who either work for one or more customers or have yet to join any of them. 
--The customer may have placed one or more orders at or above order amount 2000, and must have a grade, or he may not have placed any orders to the associated supplier.
SELECT 
	name AS "Salesman Name",
	s.city AS "Salesman City",
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	grade AS "Grade",
	purch_amt AS "Order Amount"
FROM 
	salesman2  s 
LEFT JOIN 
	customer2  c 
ON 
	s.salesman_id = c.salesman_id 
LEFT JOIN 
	orders2  o 
ON 
	o.salesman_id = c.salesman_id 
WHERE 
	purch_amt > 2000 AND grade IS NOT NULL


--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount 
--for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT
	cust_name AS "Customer Name",
	c.city AS "Customer City",
	ord_no AS "Order No",
	ord_date AS "Order Date" ,
	purch_amt AS "Order Amount"
FROM 
	customer2 c 
FULL JOIN 
	orders2  o 
ON 
	c.customer_id = o.customer_id 
WHERE 
	grade IS NOT NULL 


--17. Write a SQL query to combine each row of the salesman table with each row of the customer table
SELECT 
	* 
FROM 
	salesman2 
CROSS JOIN 
	customer2 
	

--18. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for thatsalesperson who belongs to that city
SELECT 	
	name AS "Salesman Name",
	s.city AS "Salesman City",
	cust_name AS "Customer Name",
	c.city AS "Customer City" 
FROM 
	salesman2 s 
CROSS JOIN 
	customer2 c 
WHERE 
	s.city = c.city


--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade
SELECT 	
	name AS "Salesman Name",
	s.city AS "Salesman City",
	cust_name AS "Customer Name",
	c.city AS "Customer City" 
FROM 
	salesman2 s 
CROSS JOIN
	customer2 c  
WHERE 
	s.city = c.city AND grade IS NOT NULL


--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade
SELECT 	
	name AS "Salesman Name",
	s.city AS "Salesman City",
	cust_name AS "Customer Name",
	c.city AS "Customer City" 
FROM 
	salesman2 s 
CROSS JOIN 
	customer2 c  
WHERE 
	s.city != c.city AND grade IS NOT NULL


