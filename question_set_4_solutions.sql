use sql_basics_questions;

-- 1)Identify pairs of customers who live in the same country.
select * from customers;

select * from orders;
select * from products;

select c1.customername,c2.customername from customers c1
join
customers c2
on c1.country=c2.country
and
c1.customerid<>c2.customerid
and 
c1.customerid>c2.customerid;

-- 2)Find the customer who has spent the most on their orders.
select customers.customername,sum(products.price) as total_sales from customers
join
orders
on
orders.customerid=customers.customerid
join
products
on
products.productid=orders.productid
group by customers.customername;

-- 3) Find customers who have ordered more than one type of products.
select customers.customername,count(orders.productid) as product_count from customers
join
orders
on
orders.customerid=customers.customerid
group by customers.customername
having product_count>1;

-- 4)List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered.
select products.productname,products.productid,orders.orderid from orders
right join
products
on 
products.productid=orders.productid;

-- 5)retrieve all the orders placed by customers from usa
select * from customers
join 
orders
on orders.customerid=customers.customerid
having customers.country in ('USA');

-- 6)find the name of customers who have ordered a product priced abve 500
select * from customers
join
orders
on
orders.customerid=customers.customerid
join
products
on
products.productid=orders.productid
having price>500;

-- 7)find customers who have ordered same product more than 
select customername,productid,count(orderid) from customers
join
orders
on orders.customerid=customers.customerid
group by customername,productid;
