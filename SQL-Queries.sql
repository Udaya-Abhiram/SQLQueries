-- creating database TechShop

CREATE DATABASE TechShop;
use TechShop;


-- creating Tables in TechShop

-- customer Table  

create table Customer(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	Email VARCHAR(30),
	Phone INT,
	Address VARCHAR(35)
);

--products table

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(30),
	Description TEXT,
	Price DECIMAL(10,2)
);

--orders

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	TotalAmount DECIMAL(10,2),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

--Order details

CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	Quantity INT,

	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

-- Inventory

CREATE TABLE Inventory(
	InventoryID INT PRIMARY KEY,
	ProductID INT,
	QuantityInStock INT,
	LastStockUpdate DATE,

	FOREIGN KEY(ProductId) REFERENCES Products(ProductID)
);


--- inserting data into customer table

INSERT INTO Customer VALUES
(1,'Abhi','Kona','abhiram@gmail.com',928174171, '123 street, JRG, AP'),
(2,'Sandeep','Setti','sandsetti@gmail.com',71827182, '456 street, RJY, AP'),
(3,'Hari','Devu','hari@gmail.com',928192175, '321 street, TNK, AP'),
(4,'Naveen','Dumpa','nav123@gmail.com',921274162, '832 street, VIJ, AP'),
(5,'Jeevan','Reddy','jeev42@gmail.com',828164571, '741 street, VIZ, AP'),
(6,'Govind','Chitti','chitti23@gmail.com',728144171, '563 street, SKL, AP'),
(7,'Nitish','Nandae','nit932@gmail.com',728174172, '215 street, NELL, AP'),
(8,'Akash','Singh','akasingh@gmail.com',628175176, '942 street, TDP, AP'),
(9,'Kumar','Sheik','k213@gmail.com',628174278, '256 street, JRG, AP'),
(10,'Satish','Selva','selavasat@gmail.com',628174164, '462 street, KKD, AP');

-- select * from Customer;

-- Inserting into products

INSERT INTO Products VALUES
(1, 'Mobile', 'High-performance smartphone', 499.99),
(2, 'TV', 'LED TV of 32 inches', 1299.09),
(3, 'PC', 'High-performance PC', 5499.99),
(4, 'Laptop', 'ACER i5 with fast charging', 2999.99),
(5, 'Charger', 'Ultra fast charging', 249.12),
(6, 'CPU', 'High-performance CPU', 599.52),
(7, 'Monitor', 'Better display Of 32 iches', 829.25),
(8, 'RAM chips', '4GB ram chips', 692.12),
(9, 'Cables', 'Highly Durable cables', 219.11),
(10,'keyboards', 'smooth and less sound boards',1099.10);

-- select * from Products;

-- inserting into orders

INSERT INTO Orders VALUES
(1, 1, '2024-01-06', 499.92),
(2, 2, '2024-01-07', 799.11),
(3, 3, '2024-01-08', 899.41),
(4, 4, '2024-01-09', 589.22),
(5, 5, '2024-01-10', 699.64),
(6, 6, '2024-01-11', 1099.79),
(7, 7, '2024-01-12', 239.72),
(8, 8, '2024-01-13', 519.95),
(9, 9, '2024-01-14', 511.82),
(10,10,'2024-01-15', 291.25);

-- select * from Orders;

-- inserting into orderdetails
INSERT INTO OrderDetails VALUES
(1, 1, 1, 10),
(2, 2, 2, 20),
(3, 3, 3, 11),
(4, 4, 4, 12),
(5, 5, 5, 13),
(6, 6, 6, 14),
(7, 7, 7, 15),
(8, 8, 8, 22),
(9, 9, 9, 47),
(10,10,10, 14);

-- select * from OrderDetails;

INSERT INTO Inventory VALUES
(1, 1, 50, '2024-01-06'),
(2, 2, 40, '2024-01-07'),
(3, 3, 45, '2024-01-08'),
(4, 4, 55, '2024-01-09'),
(5, 5, 65, '2024-01-10'),
(6, 6, 52, '2024-01-11'),
(7, 7, 95, '2024-01-12'),
(8, 8, 52, '2024-01-13'),
(9, 9, 25, '2024-01-14'),
(10,10, 15, '2024-01-15');


-- select * from Inventory;

-- 1. Write an SQL query to retrieve the names and emails of all customers. 
select FirstName, LastName, Email from Customer;

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names

select Orders.OrderID, Orders.OrderDate, Customer.CustomerID, Customer.FirstName 

from Orders join 

Customer on Orders.OrderID = Customer.CustomerID;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. 
-- Include customer information such as name, email, and address.

Insert into Customer Values
(11, 'Mahesh','Dev','mahesh@gmail.com',721819287,'456 street, hyd, Telangana');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

Update Products set Price = Price+(0.1*Price);

select * from Products;

--5. Write an SQL query to delete a specific order and its associated order details from the
-- "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderID INT;

SET @OrderID = 8

Delete from OrderDetails where OrderID = @OrderID;

Delete from Orders where OrderId = @OrderID;


--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
Insert into Orders values
(11,11,'2024-01-20',7432.93);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific
-- customer in the "Customers" table. Allow users to input the customer ID and new contact information

DECLARE @CustomerID INT;
DECLARE @FirstName VARCHAR(20);
DECLARE @LastName VARCHAR(20);
DECLARE @Email VARCHAR(30);
DECLARE @Phone INT;
DECLARE @Address VARCHAR(35);

SET @CustomerID = 10
SET @FirstName = 'Chey'
SET @LastName = 'Nag'
SET @Email = 'chey@gmail.com'
SET @Phone = 83428212
SET @Address ='213 street, hyd, telangana';

-- Update contact information for the specified customer
UPDATE Customer
SET 
FirstName = @FirstName,
LastName = @LastName,
Email = @Email,
Phone = @Phone,
Address = @Address
WHERE CustomerID = @CustomerID;

select * from Customer;

-- Write an SQL query to recalculate and update the total cost of each order in the "Orders"
-- table based on the prices and quantities in the "OrderDetails" table.
UPDATE Orders
Set TotalAmount = (
    select SUM(OrderDetails.Quantity * Products.Price)
    from OrderDetails
    join Products ON OrderDetails.ProductID = Products.ProductID
    Where OrderDetails.OrderID = Orders.OrderID
)

select * from Orders;


-- 9. Write an SQL query to delete all orders and their associated order details for a specific
-- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
-- as a parameter.

DECLARE @NewCustomerID INT;

SET @NewCustomerID = 5;

Delete from Orders where OrderID = @NewCustomerID;

Delete from OrderDetails where OrderID = @NewCustomerID;

Delete from OrderDetails where OrderID in (select OrderID from Orders where CustomerID = @NewCustomerID);

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
-- including product name, category, price, and any other relevant details.

Insert into Products values
(11,'Bluetooth speakers','High sound speakers',312.38);

-- Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status.ALTER TABLE Orders
ADD Status VARCHAR(20);

Insert into Customer values
(12,'arjun','das','arjun@gmail.com',4832812,'231 street,chennai,TN');
Insert into Orders values(12, 12, '2024-01-20',3821.32,'pending');select * from Orders;DECLARE @NewOrderID INT;SET @NewOrderID = 12;Update Ordersset Status = 'Completed' where OrderID = @NewOrderID;-- 12. Write an SQL query to calculate and update the number of orders placed by each customer
-- in the "Customers" table based on the data in the "Orders" table.Alter table CustomerAdd OrderCount INT;Update Customer set OrderCount = (	select count(*) from Orders where Orders.OrderID = Customer.CustomerID);select * from Customer;-- TASK-3--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--  customer name) for each orderselect c.CustomerID,c.FirstName, c.Email, o.OrderDate from Customer c join Orders o on c.CustomerID = o.OrderID;--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
-- Include the product name and the total revenue.select p.ProductID,p.ProductName,o.TotalAmount as TotalRevenue from Products p join Orders o on p.ProductID = o.OrderID ;--3. Write an SQL query to list all customers who have made at least one purchase. Include their
-- names and contact information.select c.CustomerID,c.FirstName,c.Email,c.Phone,c.Address from Customer c join Orders o on c.CustomerID = o.OrderID where o.TotalAmount is not Null;select count(*) from Customer;
--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
-- total quantity ordered. Include the product name and the total quantity ordered.

select Top 1 max(Quantity) as maxQuantity, p.ProductName from Products p join OrderDetails od on p.ProductID = od.OrderDetailID group by p.ProductName;

select * from Products;

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

Alter table Products
Add Category varchar(20); 

Update Products
set Category ='WorkGadgets' where ProductName in ('PC','Laptop', 'Monitor', 'Keyboards', 'RAM chips', 'CPU');

Update Products
set Category = 'MobilesProducts' where ProductName='Mobile' or ProductName='Charger' or ProductName='Cables';

Update Products
set Category = 'Home Gadgets' where ProductName in ('TV','Bluetooth speakers');

select * from Products;

select count(ProductID)as ProductCount, p.Category from Products p group by p.Category;

--6. Write an SQL query to calculate the average order value for each customer. Include the
-- customer's name and their average order value.

select C.CustomerID,c.FirstName, avg(o.TotalAmount) as averageOrderValue 
from Customer c join Orders o on c.CustomerID = o.CustomerID group by c.CustomerID,C.FirstName;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID,
-- customer information, and the total revenue.

select Top 1 
o.OrderID, O.CustomerID, c.FirstName, c.Email, c.Address, o.TotalAmount from Orders o join Customer c on c.CustomerID = o.OrderID order by TotalAmount DESC;

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT P.ProductID, P.ProductName, COUNT(OD.OrderID) AS NumberOfOrders
FROM Products P
LEFT JOIN
    OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY
    P.ProductID, P.ProductName
ORDER BY
    NumberOfOrders DESC;

-- 9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
-- Allow users to input the product name as a parameter.

DECLARE @NewProductName varchar(20);

SET @NewProductName = 'TV';

select c.CustomerID, c.FirstName, p.ProductName from Customer c join Products p on p.ProductID = c.CustomerID where ProductName = @NewProductName;

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate
FROM
    Customer C
JOIN
    Orders O ON C.CustomerID = O.CustomerID
JOIN
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN
    Products P ON OD.ProductID = P.ProductID
WHERE
    P.ProductName = @NewProductName;

--10 . Write an SQL query to calculate the total revenue generated by all orders placed within a
--  specific time period. Allow users to input the start and end dates as parameters.

select * from orders;

DECLARE @NewOrderDate1 Date;
DECLARE @NewOrderDate2 Date;

SET @NewOrderDate1 = '2024-01-06';
SET @NewOrderDate2 = '2024-01-10';

select sum(o.TotalAmount) as TotalRevenue from Orders o where o.OrderDate between  @NewOrderDate1 and @NewOrderDate2;



-- TASK 4

--1.Write an SQL query to find out which customers have not placed any orders.

-- select c.CustomerID,c.FirstName, c.Email from Customer c 
-- where EXISTS (select 1 from Orders o where c.CustomerID = o.CustomerID and o.TotalAmount is not Null);

select c.CustomerID,c.FirstName, c.Email from Customer c join Orders o on c.CustomerID = o.CustomerID and TotalAmount is not NULL;

--2.Write an SQL query to find the total number of products available for sale. 

select count(*) as TotalProductsAvailable from Products;

--3 Write an SQL query to calculate the total revenue generated by TechShop. 

select sum(TotalAmount) as TotalRevenue from Orders;

--4 Write an SQL query to calculate the average quantity ordered for products in a specific category.
-- Allow users to input the category name as a parameter.

DECLARE @NewCategory varchar(20);

SET @NewCategory = 'WorkGadgets';

select avg(od.Quantity) as AverageOrderQunatity, p.Category  from OrderDetails od 

join Products p on p.ProductID = od.ProductID and p.Category = @NewCategory

group by p.Category;

--5 Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--  to input the customer ID as a parameter.

DECLARE @RevenueCustomerID INT;

SET @RevenueCustomerID = 4;

select sum(o.TotalAmount) as TotalRevenue, c.FirstName
from Orders o join Customer c on o.CustomerID = C.CustomerID where o.CustomerId = @RevenueCustomerID group by c.FirstName;

--6. Write an SQL query to find the customers who have placed the most orders. List their names
-- and the number of orders they've placed.

select top 1 c.CustomerID, c.FirstName, od.Quantity from OrderDetails od 
join Orders o on od.OrderDetailID = o.OrderID join Customer c on o.CustomerID = c.CustomerID order by Quantity DESC;

-- SELECT TOP 1
    -- C.CustomerID,
    -- C.FirstName,
    -- C.LastName,
    -- COUNT(O.OrderID) AS NumberOfOrders
-- FROM  Customer C JOIN  Orders O ON C.CustomerID = O.CustomerID GROUP BY  C.CustomerID, C.FirstName, C.LastName
-- ORDER BY NumberOfOrders DESC;


--7.  Write an SQL query to find the most popular product category, which is the one with the highest
-- total quantity ordered across all orders.

select * from Products;

select top 1 p.ProductID, p.Category, od.Quantity from OrderDetails od 
join Products p on od.ProductID = p.ProductID  order by Quantity DESC;

--8 Write an SQL query to find the customer who has spent the most money (highest total revenue)
-- on electronic gadgets. List their name and total spending.

select top 1 c.FirstName, c.Email, o.TotalAmount as TotalAmount from Customer c join Orders o on o.CustomerID = c.CustomerID order by TotalAmount DESC; 

-- 9 Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

select avg(TotalAmount) as AvgRevenue from Orders;

--10 Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.

select c.CustomerId, c.FirstName,c.Email,count(o.OrderID) as count from Customer c 
left join Orders o on c.CustomerID = o.OrderID group by c.FirstName, c.Email,c.CustomerID;