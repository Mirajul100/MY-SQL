create database collage;
use collage;

drop database collage;

create table student(
student_id int primary key,
student_name varchar (30),
marks int not null,
city varchar(20),
grade varchar(1)
);

drop table student;

insert into student 
(student_id , student_name , marks , city , grade)
value 
(101 , "anik", 78 , "barisal" , "C"),
(102 , "rabbi", 93 ,"gazipur" , "A"),
(103 , "shawon", 85 ,"gazipur" ,  "B"),
(104 , "tasin", 96 , "kumilla" ,  "A"),
(105 , "abir", 12 , "kumilla" ,  "F"),
(106 , "tskin", 82 , "kumilla" ,  "B");

select * from student;

alter table student 
add column age int not null default 19;

alter table student 
modify column age varchar(2);

alter table student 
change age student_age int not null;

alter table student 
drop column student_age;

alter table student 
drop column city;

insert into student 
(student_id , student_name, marks , city , grade , student_age)
value 
(107 , "tania" , 64 , "barishal" , "D" , 100); 

truncate table student;
