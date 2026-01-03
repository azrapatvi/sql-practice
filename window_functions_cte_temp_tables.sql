use employee_details;

CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

select * from students;

select *,row_number() over (order by marks desc) as row_numbers
from students;

select *,rank() over(order by marks desc) as rank_func
from students;

select *,dense_rank() over(order by marks desc) as ranked
from students;

-- we want to see ranks for each subject based on marks then
select *,row_number() over (partition by subject order by marks desc) as ranked
from students;

select *,rank() over(partition by subject order by marks desc) as ranked from students;

select *,dense_rank() over (partition by subject order by marks desc) as ranked from students;

with cte1 as(
	select * from students
)
select * from cte1;

CREATE TEMPORARY TABLE temp2
SELECT * FROM students
WHERE 1 = 0;

select * from temp2;

with cte2 as(
	select * from students where student_name in('Alice','Bob')
)
insert into temp2 
select * from cte2;
