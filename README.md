# SQL Practice Repository

This repository contains my **SQL practice work** created while learning and revising core SQL concepts.  
All queries are written by **observing examples, practicing syntax, and experimenting with different SQL operations**.

⚠️ **Note:**  
This is **not a real-world project**.  
It is purely a **learning & practice repository** to strengthen SQL fundamentals.

---

## 🗄️ Databases Used
- **Database Names:** 
  - `employee_details`
  - `SQL_Basics_Questions` *(added recently for practice solutions)*

All tables and queries are created and executed inside these databases.

---

## 📌 Topics Covered

### 1️⃣ Database & Table Creation
- Creating databases
- Creating tables with appropriate data types
- Using primary keys and foreign keys

Examples:
- `employees`
- `sales`
- `products`
- `customers`
- `orders`

---

### 2️⃣ Data Insertion
- Inserting single and multiple records
- Handling `NULL` values

---

### 3️⃣ Basic SQL Queries
- `SELECT`
- `DISTINCT`
- `WHERE`
- `ORDER BY`
- `LIMIT`

---

### 4️⃣ Filtering & Conditions
- `AND`, `OR`, `NOT`
- `IN`, `NOT IN`
- `BETWEEN`, `NOT BETWEEN`
- `IS NULL`, `IS NOT NULL`

---

### 5️⃣ Aggregate Functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`

Used mainly on the **Sales** table for analytical queries.

---

### 6️⃣ Temporary Tables
- `CREATE TEMPORARY TABLE`
- Understanding session-based tables
- Updating and deleting temporary data

---

### 7️⃣ JOIN Operations
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `UNION ALL`

Used on:
- Sample tables (`table1`, `table2`)
- Realistic tables (`customers`, `orders`)

---

### 8️⃣ Subqueries
- Using subqueries inside `WHERE`
- Filtering records based on results of another query

Example:
- Finding customers who placed orders in a specific date range

---

### 9️⃣ CASE Statements
- Simple `CASE`
- Nested `CASE`
- Using `CASE` in `SELECT`
- Using `CASE` in `ORDER BY`

Used to:
- Categorize prices (`Low / Medium / High`)
- Classify products as `Affordable` or `Premium`

---

### 🔟 Data Manipulation
- `UPDATE`
- `DELETE`
- Copying table structure and data using:
  - `CREATE TABLE LIKE`
  - `INSERT INTO ... SELECT`

---

## 🗂️ Practice Solution Files Added
- `question_set_1_solutions.sql`  
  - Contains basic queries on the `Employees` table, including:
    - Selecting columns
    - Filtering by department and salary
    - Sorting results
    - Using `DISTINCT`, `COUNT`, `MAX`, `AVG`
    - Pattern matching with `LIKE`
- `question_set_2_solutions.sql`  
  - Contains intermediate queries on the `Employees` table, including:
    - Combined conditions using `AND`, `OR`, `NOT`
    - Range filtering with `BETWEEN`
    - Inclusion/exclusion using `IN` and `NOT IN`
    - Complex logical queries combining multiple conditions
- `question_set_3_solutions.sql`  
  - Contains queries on `Customers`, `Orders`, and `Products` tables, including:
    - Finding customers who placed orders
    - Customers who haven’t placed orders
    - Listing orders with product names and prices
    - Counting orders per customer
    - Identifying products never ordered
- `question_set_4_solutions.sql`  
  - Contains more advanced queries on `Customers`, `Orders`, and `Products`, including:
    - Identifying customer pairs in the same country
    - Finding top-spending customers
    - Customers ordering multiple product types
    - Using `RIGHT JOIN` to find all products including un-ordered ones
    - Filtering orders by country or product price
    - Counting repeated orders of the same product

---

## 📂 Repository Structure (Suggested)
```
SQL-Practice/
│
├── sql_basics.sql
├── question_set_1_solutions.sql
├── question_set_2_solutions.sql
├── question_set_3_solutions.sql
├── question_set_4_solutions.sql
├── joins_and_aggregations.sql
├── joins_and_subqueries.sql
├── case_statements.sql
└── README.md
```

---

## 🎯 Purpose of This Repository
- Strengthen SQL fundamentals
- Build confidence in writing queries
- Maintain a revision-ready SQL reference
- Showcase learning progress on GitHub

---

## 🛠️ Tools Used
- MySQL (syntax compatible with most SQL databases)

---

## ✨ Final Note
This repository reflects my **learning journey in SQL** and will continue to grow as I explore more advanced concepts.
