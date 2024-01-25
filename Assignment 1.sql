--Write a query to get a Product list (id, name, unit price) where current products cost less than $20

SELECT product_id, product_name, unit_price  FROM products WHERE unit_price < 20;



--Write a query to get Product list (id, name, unit price) where products cost between $15 and $25

SELECT product_id, product_name, unit_price  FROM products WHERE unit_price BETWEEN 15 AND 25;



--Write a query to get Product list (name, unit price) of above average price

SELECT product_name, unit_price  FROM products WHERE unit_price > (SELECT AVG(unit_price) FROM products);



--Write a query to get Product list (name, unit price) of ten most expensive products

SELECT top 10  product_name, unit_price  FROM products ORDER BY unit_price DESC ;



--Write a query to count current and discontinued products

SELECT count(discontinued) AS Discontinued_active  FROM products  GROUP BY discontinued;



--Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order

SELECT product_name, units_on_order, units_in_stock  FROM products WHERE units_in_stock < units_on_order;
