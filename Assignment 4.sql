--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
 --freight. If it does, a message will be displayed and the command will be cancelled.



--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Employee Sales by Country
ALTER PROCEDURE EmployeeSales(
 @Employee varchar(100) 
 )
as 
BEGIN
SELECT city,sum(purch_amt) "Total sales" FROM salesman s JOIN orders o on s.salesman_id=o.salesman_id WHERE city = @Employee group by s.city
END

exec EmployeeSales @Employee = "New York"



--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales by Year
ALTER PROCEDURE SalesByYear
(
 @year varchar(5)
)
as begin
SElect year(ord_date) "Year",sum(purch_amt) "Total Amount" from orders Where YEAR(ord_date) = @year group by year(ord_date)
end

exec SalesByYear @year= "2012"


--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales By Category
ALTER PROCEDURE SalesByCategory(
 @category varchar(100) = NULL
)
as 
BEGIN
SELECT category_name,sum(unit_price)"Total Sales" FROM categories as c JOIN products as p ON c.category_id=p.category_id WHERE category_name = @category group by category_name
END

exec SalesByCategory @category="produce"


--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Ten Most Expensive Products
alter PROCEDURE ExpensiveProduct
as 
BEGIN 
SELECT TOP 10 product_name,unit_price FROM products ORDER BY unit_price DESC
END

exec ExpensiveProduct 


--6. write a SQL query to Create Stored procedure in the Northwind database to insert 
--Customer Order Details
alter procedure OrderInsert(
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


exec OrderInsert
@orderno="1",
@amount="299" ,
@orderdate='2019-08-19' ,
@customerid="222" ,
@salesmenid ="333"

select * from orders

--7. write a SQL query to Create Stored procedure in the Northwind database to update 
--Customer Order Details
alter procedure orderupdate(
@check int,
@orderno int ,
@amount float ,
@orderdate date,
@customerid int ,
@salesmenid int 
)
as
begin
update orders set ord_no=@orderno,purch_amt=@amount,ord_date=@orderdate,customer_id=@customerid,salesman_id=@salesmenid WHERE ord_no=@check
end


exec orderupdate
@check = "1",
@orderno="2",
@amount="2999" ,
@orderdate='2055-08-19' ,
@customerid="2221" ,
@salesmenid ="993"






select * from products
select * from customer
select * from Department
select * from Employees
select * from orders
select * from salesman





