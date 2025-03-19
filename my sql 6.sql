CREATE DATABASE student_management;

USE student_management;

CREATE TABLE student_deatails(
Roll INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(30),
Gender VARCHAR(10),
Age INT NOT NULL,
PRIMARY KEY (Roll)
);

INSERT INTO student_deatails
(Name , Gender  , Age)
VALUES
("Rahim", "Male" , 18),
("farjana", "Female" , 14),
("Mahfiz", "Male" , 12),
("Farjana", "Female" , 2);

DROP TABLE student_deatails;

SELECT * FROM student_deatails;

CREATE TABLE result(
reg_number INT NOT NULL,
Roll INT ,
gpa DOUBLE,
group_name VARCHAR (20)
);

INSERT INTO result
(reg_number , Roll , gpa , group_name)
VALUES
(20171,102,3.45,"Science"),
(20172,101,3.44,"Arts"),
(20173,103,4,"Science"),
(20174,104,5,"Commarce"),
(20175,105,3.45,"Science");


DROP TABLE result;

TRUNCATE TABLE result;

SELECT * FROM result;

# print the tabel information
SELECT reg_number,name , st.Roll, gpa , group_name
FROM student_deatails st INNER JOIN result r
WHERE st.Roll = r.Roll;

SELECT reg_number, name , st.Roll , gpa , group_name
FROM student_deatails st LEFT JOIN result r ON st.Roll = r.Roll;

SELECT reg_number, name , st.Roll , gpa , group_name
FROM student_deatails st RIGHT JOIN result r on st.Roll = r.Roll
