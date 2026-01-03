-- Create a new database named employee_details
create database employee_details;

use employee_details;

create table employees(
	emp_id int primary key,
    fname varchar(50),
    lname varchar(50),
    dept varchar(50),
    salary decimal(10,2),
    hiredate date
);

insert into employees (emp_id,fname,lname,dept,salary,hiredate) values 
(101, 'Amit',   'Sharma',  'IT',        55000.00, '2021-03-15'),
(102, 'Neha',   'Verma',   'HR',        42000.50, '2020-07-10'),
(103, 'Rohit',  'Patel',   'Finance',   68000.75, '2019-11-01'),
(104, 'Pooja',  'Nair',    'Marketing', 50000.00, '2022-01-20'),
(105, 'Karan',  'Singh',   'IT',        72000.25, '2018-05-30'),
(106, 'Sneha',  'Iyer',    'HR',        46000.00, '2021-09-12'),
(107, 'Rahul',  'Mehta',   'Finance',   81000.90, '2017-04-18'),
(108, 'Anjali', 'Kulkarni','Marketing', 48000.60, '2023-02-05'),
(109, 'Vikas',  'Gupta',   'IT',        66000.00, '2020-12-25'),
(110, 'Ritu',   'Chopra',  'Sales',     53000.40, '2019-08-14');

select * from employees; -- fetch the data from employees table

-- this will return all the names as it is including duplicate values
select fname,lname from employees;

-- this will show only the unique names like if there is amit 2 times then it will show you amit only once ...no duplicacy
select distinct fname from employees; 

-- retrieve full name in a single column
select emp_id,concat(fname,' ',lname) as full_name from employees;

-- inserted additional rows in employees table
INSERT INTO employees (emp_id, fname, lname, dept, salary, hiredate) VALUES
(111, 'Amit',   'Kumar',   'IT',        58000.00, '2022-06-10'),
(112, 'Neha',   'Shah',    'HR',        43000.00, '2021-08-22'),
(113, 'Rohit',  'Desai',   'Finance',   69000.50, '2020-02-14'),
(114, 'Pooja',  'Joshi',   'Marketing', 51000.00, '2023-03-01'),
(115, 'Amit',   'Verma',   'IT',        60000.00, '2019-10-05');

select count(distinct fname) from employees; -- will show you distinct count of fname

-- Fetch unique combinations of first name and last name
select distinct fname,lname from employees;


-- will create a temporary table and this table will be visible or available only at this tab
CREATE TEMPORARY TABLE temp1  
AS
SELECT *
FROM employees;

-- View data from temporary table temp1
select * from temp1;

-- will fetch the data where the emp_id is 102 
select * from employees 
where emp_id=102; 

-- will select the employees whose ids are less than and equals to 105
select * from employees 
where emp_id<=105;

-- Fetch employees earning salary greater than or equal to 70000
select * from employees 
where salary>=70000;

-- Fetch top 5 highest paid employees
select * from employees 
order by salary desc
limit 5;

-- Sort employees by first name (ascending) and salary (descending)
select * from employees
order by fname asc,salary desc;

-- and , or
-- Fetch employees where first name is 'Amit' AND salary is exactly 60000 when both conditions become true then only it will show the details
select * from employees
where fname='Amit' and salary=60000;

-- Fetch employees where first name is 'Amit' OR salary is greater than or equal to 60000
select * from employees
where fname='Amit' or salary>=60000;

-- not in
select * from employees
where dept not in('Finance','Marketing');

-- not
select * from employees 
where not fname='Amit';

-- between
select * from employees
where salary between 60000 and 70000;

-- not between
select * from employees
where salary not between 60000 and 70000;

-- in
select * from employees
where dept in ('HR');

select * from employees
where dept not in ('HR');

-- null operator to find the null values
select * from employees
where dept is not null;


-- create temporaray table 
create temporary table temp2
as select * from employees;

select * from temp2
where dept is null;

INSERT INTO temp2 (emp_id, fname, lname, dept, salary, hiredate)
VALUES (120, 'aditi', 'gore', NULL, NULL, NULL);

-- update

update temp2
set dept='IT'
where dept is null;

select * from temp2;

delete from temp2
where emp_id=120;

drop table temp2;

select * from temp2;
