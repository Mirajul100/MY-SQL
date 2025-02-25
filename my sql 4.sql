create database school;
use school;

drop database school;

create table dep(
department_name varchar(10),
cource_id int primary key,
cource_name varchar(10)
);

insert into dep
(department_name , cource_id , cource_name)
values
("cse" , 111 , "english"),
("cse" , 112 , "physich"),
("cse" , 113 , "math"),
("cse" , 114 , "programing"),
("cse" , 115 , "biology");

create table teacher(
teacher_id int primary key,
teacher_name varchar(30),
dep_id int ,
foreign key (dep_id) references dep(cource_id)
on update cascade 
on delete cascade
);

drop table dep;
drop table teacher;

insert into teacher
(teacher_id , teacher_name , dep_id)
values
(1001 , "safin" , 114),
(1002 , "rohim" , 113),
(1003 , "fatema" , 111),
(1004 , "sizan" , 113);

create table student(
student_id int primary key,
student_first_name varchar(30),
student_last_name varchar (30),
student_age int not null,
student_Phone_number bigint not null,
city varchar(20),
father_name varchar (30),
mother_name varchar (300),
grade varchar (2),
cgpa double
);

insert into student
(student_id , student_first_name , student_last_name , student_age , student_phone_number , city , father_name , mother_name ,grade , cgpa)
values
(101,"mirajul islam", "anik" , 23 , 01747200359 , "gazipur" , "hanif" , "lizu" , "A" , 3.50),
(102,"asrafull", "tasin" , 23 , 01747200000 , "cumilla" , "saif" , "sultana" , "A+" , 4.00),
(103,"abdulla", "mofiz" , 22 , 01747200350 , "barisal" , "siam" , "samanta" , "B" , 3.25),
(104,"sammim", "usman" , 24 , 017472120359 , "barisal" , "rahman" , "rohima" , "A" , 3.50),
(105,"asraf", "abdulla" , 23 , 01747100359 , "gazipur" , "rabbi" , "liza" , "f" , 0.00);

drop table student;
truncate table student;

set sql_safe_updates = 0;

update student 
set student_phone_number = 01747212359
where student_id = 104;

select student_first_name , student_last_name 
from student 
where cgpa >= 3.50;

select student_id 
from student
where grade = "A+"
group by student_id 
having max(cgpa);

select student_id ,student_last_name , city , father_name , cgpa
from student
where cgpa >= 3.00
order by cgpa desc;

select student_last_name , student_id
from student
where grade = "A+"
group by student_last_name , student_id
having max(cgpa);

select student_first_name , student_last_name , student_phone_number
from student
where grade = "f";

select cgpa ,student_last_name , student_phone_number
from student
where student_age = 23
group by cgpa ,student_last_name , student_phone_number
order by cgpa desc;

delete from student 
where student_id = 101;

select * from student;
select * from teacher;
select * from dep;

select teacher_name , cource_name from teacher , dep;

