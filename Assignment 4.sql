SELECT * FROM customers
SELECT * FROM orders
SELECT * FROM employees
SELECT * FROM categories
SELECT * FROM order_details
SELECT * FROM products

--create comman view
ALTER VIEW comman AS SELECT od.unit_price,o.order_id,e.city,o.order_date,c.category_id,c.category_name FROM order_details AS od JOIN orders AS o ON od.order_id=o.order_id JOIN employees AS e ON e.employee_id=o.employee_id JOIN products AS p ON p.product_id=od.product_id JOIN categories AS c ON c.category_id=p.category_id
SELECT * FROM comman

--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
 --freight. If it does, a message will be displayed and the command will be cancelled.

ALTER PROCEDURE averageFreight
AS 
BEGIN 
	SELECT avg(freight) FROM orders
END
EXEC averageFreight

ALTER TRIGGER tr_insert_freight
ON orders
INSTEAD OF INSERT,UPDATE
AS
BEGIN
   DECLARE @freightvalue float
   SELECT @freightvalue = freight FROM inserted
   DECLARE @avgfreightvalue float
   SELECT @avgfreightvalue =  AVG(freight) FROM orders
	IF(@freightvalue>=@avgfreightvalue)
	BEGIN
	raiserror('You enter out of average freight value',16,1)
	RETURN
	END
	INSERT INTO orders	(order_id,customer_id ,employee_id ,order_date,required_date, shipped_date , ship_via, freight, ship_name ,ship_address,ship_city,ship_region,ship_postal_code,ship_country) 
	SELECT  order_id,customer_id ,employee_id ,order_date,required_date,shipped_date ,ship_via,freight,ship_name ,ship_address ,ship_city,ship_region ,ship_postal_code,ship_country
	FROM inserted
end

UPDATE orders set freight=100 where order_id=3
INSERT INTO orders VALUES (3, 'Tej', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 500, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
SELECT * FROM orders where order_id=3
delete FROM orders where order_id=3

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Employee Sales by Country
ALTER PROCEDURE EmployeeSales(
 @searchcity varchar(100) 
 )
AS 
BEGIN
	SELECT city,SUM(unit_price) AS "Total Sales" FROM comman WHERE city = @searchcity GROUP BY city
END

EXEC EmployeeSales @searchcity = "LONDON"


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales by Year
ALTER PROCEDURE SalesByYear
(
 @year varchar(5)
)
AS BEGIN
	SELECT YEAR(order_date) "Year",SUM(unit_price) "Total Amount" FROM comman Where YEAR(order_date) = @year group by YEAR(order_date)
END

exec SalesByYear @year= "1997"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales By Category
ALTER PROCEDURE SalesByCategory(
 @category varchar(100) = NULL
)
AS 
BEGIN
	SELECT category_name, sum(unit_price)"Total Sales" FROM comman WHERE category_name=@category GROUP BY category_name 
END

EXEC SalesByCategory @category="produce"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Ten Most Expensive Products
ALTER PROCEDURE ExpensiveProduct
AS 
BEGIN 
	SELECT TOP 10 product_name,unit_price FROM products ORDER BY unit_price DESC
END

EXEC ExpensiveProduct 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. write a SQL query to Create Stored procedure in the Northwind database to insert 
--Customer Order Details
ALTER PROCEDURE OrderInsert(
@orderid int ,
@productid int ,
@unitprice float,
@quantity int ,
@discount float 
)
AS
BEGIN
	INSERT INTO order_details VALUES (@orderid,@productid,@unitprice,@quantity,@discount)
END



EXEC OrderInsert
@orderid="1",
@productid="299" ,
@unitprice="96" ,
@quantity="222" ,
@discount ="333"

SELECT * FROM order_details WHERE order_id=1
DELETE FROM order_details WHERE order_id=1
SELECT * FROM order_details WHERE order_id=2
delete FROM order_details WHERE order_id=2

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--7. write a SQL query to Create Stored procedure in the Northwind database to update 
--Customer Order Details
ALTER PROCEDURE orderupdate(
@check int,
@orderid int ,
@productid int ,
@unitprice float,
@quantity int ,
@discount float 
)
AS
BEGIN
	UPDATE order_details SET order_id=@orderid,product_id=@productid,unit_price=@unitprice,quantity=@quantity,discount=@discount WHERE order_id=@check
END


EXEC orderupdate
@check = "1",
@orderid="2",
@productid="2999" ,
@unitprice="312" ,
@quantity="2221" ,
@discount="993"








