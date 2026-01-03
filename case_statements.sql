
-- ------------------------------------
-- CASE examples
-- ------------------------------------

use employee_details;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(20),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(50),
    Rating DECIMAL(3, 1)
);

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, Rating) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'Tech Supplies', 4.5),
(2, 'Office Chair', 'Furniture', 120.00, 85, 'Comfort Co', 4.7),
(3, 'Water Bottle', 'Accessories', 15.00, 250, 'AquaGear', 4.3),
(4, 'Laptop Backpack', 'Accessories', 45.99, 200, 'GearUp', 4.6),
(5, 'Gaming Laptop', 'Electronics', 999.99, 45, 'Tech Supplies', 4.8),
(6, 'Desk Lamp', 'Furniture', 35.00, 120, 'LightHouse', 4.2),
(7, 'Bluetooth Speaker', 'Electronics', 59.99, 95, 'SoundWave', 4.4),
(8, 'Standing Desk', 'Furniture', 250.00, 50, 'Comfort Co', 4.9),
(9, 'Fitness Tracker', 'Electronics', 129.99, 180, 'FitTech', 4.7),
(10, 'Coffee Mug', 'Accessories', 9.99, 300, 'MugMasters', 4.1);

select * from products;

-- --------------------------------------------------
-- CASE Example 1:
-- Categorize products into Low / Medium / High
-- based on their price
-- --------------------------------------------------
select *,
case 
	when price>500 then 'high'
    when price<=500 and price>=200 then 'medium'
    else 'low'
end as 'price category'
from products;

-- --------------------------------------------------
-- CASE Example 2:
-- Classify products as Affordable or Premium
-- using nested CASE statements
-- --------------------------------------------------
select 
*,
case 
	when category in('Electronics') then
		case 
			when price>=300 then 'premium'
			else 'affordable'
        end
	when category in ('Furniture') then
		case
			when price>=300 then 'premium'
            else 'affordable'
		end
	else 
		case 
			when price>=300 then 'premium'
            else 'affordable'
		end
end as price_affordability_classification
from products;

-- --------------------------------------------------
-- CASE Example 3:
-- Same affordability classification
-- Ordered by category using CASE in ORDER BY
-- --------------------------------------------------

select 
*,
case 
	when category in('Electronics') then
		case 
			when price>=300 then 'premium'
			else 'affordable'
        end
	when category in ('Furniture') then
		case
			when price>=300 then 'premium'
            else 'affordable'
		end
	else 
		case 
			when price>=300 then 'premium'
            else 'affordable'
		end
end as affordable_premium
from products
order by 
case 
	when category in('Electronics') then 1
    when category in('Accessories') then 2
    else 3
end;

-- --------------------------------------------------
-- Insert a new product with NULL values
-- --------------------------------------------------
insert into products(productid,productname,category,price,stockquantity,supplier,rating) values (101,'Fitness Tracker','Electronics',130,20,Null,Null);

select * from products;

-- --------------------------------------------------
-- Update NULL supplier value for the new product
-- --------------------------------------------------
update products
set supplier='Fit tech'
where productid=101;

-- --------------------------------------------------
-- Copy table structure and data
-- Demonstrates CREATE TABLE LIKE + INSERT SELECT
-- --------------------------------------------------

CREATE TABLE new_table1 LIKE products;

INSERT INTO new_table1
SELECT * FROM products;

select * from new_table1;
