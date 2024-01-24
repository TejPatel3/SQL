--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
 --freight. If it does, a message will be displayed and the command will be cancelled.



--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Employee Sales by Country
exec EmployeeSales @Employee = "Paris"



--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales by Year
exec SalesByYear @year= "2013"


--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales By Category
exec SalesByCategory @category="produce"


--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Ten Most Expensive Products
exec ExpensiveProduct 


--6. write a SQL query to Create Stored procedure in the Northwind database to insert 
--Customer Order Details 



--7. write a SQL query to Create Stored procedure in the Northwind database to update 
--Customer Order Details


create procedure OrderInsert(
@orderno int ,
@amount float ,
@orderdate date,
@customerid int ,
@salesmenid int 
)
as
begin
insert into orders values (@orderno,@amount,@orderdate,@customerid,@salesmenid)
end

select * from products
select * from customer
select * from Department
select * from Employees
select * from orders


select * from salesman


ALTER PROCEDURE EmployeeSales(
 @Employee varchar(100) 

)
as 
BEGIN
SELECT name,city FROM salesman WHERE city = @Employee
END

ALTER PROCEDURE SalesByCategory(
 @category varchar(100) = NULL

)
as 
BEGIN
SELECT category_name,product_name FROM categories as c JOIN products as p ON c.category_id=p.category_id WHERE category_name = @category
END

alter PROCEDURE ExpensiveProduct


as 
BEGIN 
SELECT TOP 10 product_name FROM products ORDER BY unit_price
END

ALTER PROCEDURE SalesByYear
(
 @year varchar(5)
)
as begin
SElect * from orders Where YEAR(ord_date) = @year
end
