CREATE DATABASE university;
USE university;

DROP DATABASE university;

CREATE TABLE department(
departmentId INT PRIMARY KEY,
departmentName VARCHAR(50)
);

DROP TABLE department;

INSERT INTO department 
(departmentId , departmentName) VALUES 
(101 , "HR"),
(102 , "IT"),
(103 , "Finance");

CREATE TABLE employee(
empId INT PRIMARY KEY,
name VARCHAR(30),
departmentId INT ,
salary DECIMAL(10,2),
FOREIGN KEY(departmentId) REFERENCES department (departmentId)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO employee 
(empId , name , departmentId , salary ) VALUES
(1 , "Alice" , 101 , 75000),
(2 , "Bob" , 102 , 85000),
(3 , "Charlie" , 101 , 65000),
(4 , "David" , 103 , 95000),
(5 , "Emma" , 102 , 72000);

DROP TABLE employee;

CREATE TABLE students(
id INT PRIMARY KEY,
name VARCHAR (50),
age INT,
department VARCHAR (50)
);

DROP TABLE students;

INSERT INTO students 
(id , name , age , department) VALUE
(1125 , "anik" , 23 , "CSE"),
(1126 , "tasin" , 24 , "SWE"),
(1127 , "kabbo" , 22 , "NFE"),
(1128 , "abir" , 23 , "SWE"),
(1129 , "rabbi" , 25 , "CSE");

ALTER TABLE departments
ADD COLUMN depName VARCHAR(10);

ALTER TABLE departments
DROP COLUMN depName;

ALTER TABLE departments 
RENAME TO department;

ALTER TABLE employee
ADD COLUMN age INT;

SELECT * FROM department;

SELECT * FROM employee;

SELECT name , empId , departmentId FROM employee;

SELECT name , salary FROM employee WHERE 80000 > salary;

SELECT name , empId , salary FROM employee ORDER BY salary DESC;

SELECT * FROM employee WHERE departmentId = 102 AND salary > 60000;

SELECT * FROM students;

ALTER TABLE students 
ADD COLUMN email VARCHAR (100);

ALTER TABLE students 
MODIFY age TINYINT;

ALTER TABLE students 
RENAME university_students;

SELECT * FROM university_students;

SELECT name , department FROM university_students;

SELECT name FROM university_students WHERE department = "CSE";

SELECT name FROM university_students ORDER BY age DESC;

-- find employee earning more than the avarare salary
SELECT name , salary FROM employee 
WHERE salary > (SELECT AVG(salary) FROM employee);

-- find employee earning more than the avarage salary in thir department
SELECT name , salary , departmentId FROM employee e1
WHERE salary > (SELECT AVG(salary) FROM employee e2 
WHERE e2.departmentId = e1.departmentId);

-- Retrieve employee names along with their department names using a subquery 
SELECT name , (SELECT departmentName 
FROM department d 
WHERE d.departmentId = e.departmentId) 
AS departmentName
FROM employee e;

-- Find the employee with the highest salary in each department
SELECT name  , salary , departmentId FROM employee e1 
WHERE salary =
(SELECT MAX(salary)
FROM employee e2
WHERE e2.departmentId = e1.departmentId);

-- List employee earning more the avarage salary of all employee
SELECT name , salary , departmentId 
FROM employee e 
WHERE salary > 
(SELECT AVG (salary) FROM employee);

-- Find the highest , lowest and avarage salary in each department
SELECT departmentId , 
MAX(salary) AS high , 
MIN(salary) AS lowest , 
AVG(salary) AS avarage 
FROM employee
GROUP BY departmentId;
