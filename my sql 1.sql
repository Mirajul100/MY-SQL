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

select city ,count(student_name) from student group by city having max(marks) > 90;

select city,student_name,marks,grade,student_id  
from student 
where grade = "A" 
group by city,student_name,marks,grade,student_id
having max(marks) >= 90
order by marks desc;

set sql_safe_updates = 0;

update student 
set marks = 90
where student_id = 101;

update student 
set grade = "O"
where student_id = 101;

update student 
set marks = marks + 1;

delete from student 
where student_id = 105;

select city , student_id , student_name ,marks, grade
from student 
where grade = "O"
group by city , student_id , student_name ,marks, grade 
having max(marks) >= 90
order by marks desc;


select * from student;
