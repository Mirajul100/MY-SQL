create database collage;
use collage;

drop database collage;

create table dept (
id int primary key,
cource_name varchar(30)
);

insert into dept 
(id , cource_name)
value 
(101,"math"),
(102,"english");

update dept
set id = "103"
where id = "102";

select * from dept;

create table teacher(
id int primary key,
teacher_name varchar(40),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);

insert into teacher 
(id , teacher_name , dept_id)
value 
(1001 , "anik" , 101),
(1002 , "siam" , 102);

select * from teacher;

create table student(
student_id int primary key,
student_name varchar (30),
marks int not null,
city varchar(20),
grade varchar(1)
);

drop table student;
drop table teacher;
drop table dept;

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