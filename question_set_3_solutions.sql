
use sql_basics_questions;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);

-- 1) Write an SQL query to find the names of customers who have placed an order.
select * from customers;
select * from orders;
select * from products;

select distinct customers.customername 
from customers
join
orders
on
orders.customerid=customers.customerid;

-- 2)Find the list of customers who have not placed any orders.
select *
from customers
left join
orders
on
orders.customerid=customers.customerid
where
orders.orderid is Null;

-- 3)List all orders along with the product name and price.
select distinct products.productname,products.price from orders
join
products
on products.productid=orders.productid;

-- 4)Find the names of customers and their orders, including customers who haven't placed any orders.
SELECT distinct customers.customername ,orders.orderid
FROM customers 
LEFT JOIN orders 
ON customers.customerid = orders.customerid;

-- 5) retrive list of products that have never been orders
select * from customers;
select * from orders;
select * from products;

select * from products
left join
orders
on
products.productid=orders.productid
where orders.orderid is Null;

-- 6) total number of ordes placed by each customer
select customers.customername,count(orders.orderid) as order_count from customers
left join
orders
on orders.customerid=customers.customerid
group by customers.customername
order by order_count desc;

-- 7)Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select customers.customername,products.productid,products.productname,orders.orderdate from customers
left join
orders
on 
customers.customerid=orders.customerid
left join
products
on
products.productid=orders.productid;
