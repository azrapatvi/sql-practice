use employee_details;

-- Creating a table with more columns, including a varchar column
CREATE TABLE Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)  -- New varchar column for payment method
);

-- Inserting more sample data (10 records), including NULL values
INSERT INTO Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 2, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-04', 12, 300.00, 106, 3, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 3, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-05', 15, 375.00, 109, 3, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 2, 203, 'Credit Card');


select * from sales;

-- Total sales amount grouped by SaleDate
select Saledate,sum(totalamount) from sales
group by saledate;

-- Maximum value in PaymentMethod column
select max(paymentmethod) from sales; -- works on categorical column as well

-- Fetch distinct ProductIDs
select distinct productid from sales;

-- Maximum quantity sold for each product id
select productid,max(quantity) from sales
group by productid;

-- Maximum total amount for salesdate
select saledate,max(totalamount) as maximum_total_amt from sales
group by saledate
order by maximum_total_amt desc;

select * from sales;

-- Minimum total amount in the table
select min(totalamount) from sales;

-- Minimum total amount per SaleDate, ascending order
select saledate,min(totalamount) as totalamount from sales
group by saledate
order by totalamount asc;

-- Sum of quantity for all sales
select sum(Quantity) from sales;

-- Average total amount for all sales
select avg(TotalAmount) from sales;

-- Count of Quantity entries
select count(Quantity) from sales;

-- Aggregated statistics per ProductID
select 
productid,
sum(quantity) as total_qty,
sum(totalamount) as total_amt,
avg(quantity) as avg_qty,
avg(totalamount) as avg_amt
from sales
group by productid;

-- total sales amount for each payment method
select paymentmethod,sum(totalamount) as total_amt from sales
group by paymentmethod
order by total_amt desc;

select * from sales;

select * from sales where productid=1;

select productid,paymentmethod,sum(totalamount) as total_amt from sales
group by productid,paymentmethod;

select saledate,sum(totalamount) as total_sales from sales
group by saledate
having total_sales>300;

-- ------------------------------------
-- JOIN Examples
-- ------------------------------------

DROP TABLE IF EXISTS table1;
DROP TABLE IF EXISTS table2;

CREATE TABLE table1 (
    C1 INT,
    C2 TEXT
);

CREATE TABLE table2 (
    C1 INT,
    C3 TEXT
);

INSERT INTO table1 (C1, C2) VALUES
(1,'A'),
(1,'B'),
(2,'C'),
(NULL,'D'),
(3,'E'),
(7,'DA');

INSERT INTO table2 (C1, C3) VALUES
(1,'XA'),
(2,'MB'),
(2,'NX'),
(NULL,'MO'),
(4,'XY'),
(5,'TF');

select * from table1;
select * from table2;

-- INNER JOIN example: only matching C1 values
select * from table1
inner join
table2
on
table1.c1=table2.c1;


-- Selecting specific columns with INNER JOIN
select table1.c1,table1.c2,table2.c3 from table1
inner join
table2
on table1.c1=table2.c1;

-- LEFT JOIN example: all rows from table1
select * from table1
left join
table2
on 
table1.c1=table2.c1;

-- Selecting specific columns with LEFT JOIN
select table1.c1,table1.c2,table2.c3 from table1
left join
table2
on
table1.c1=table2.c1;


-- RIGHT JOIN example: all rows from table2
select * from table1
right join
table2
on table2.c1=table1.c1;

-- Selecting specific columns with RIGHT JOIN
select table1.c1,table1.c2,table2.c3 from table1
right join
table2
on 
table1.c1=table2.c1;


-- UNION ALL example: combine rows from table1 and table2
select c1,c2 from table1
union all
select c1,c3 from table2;


