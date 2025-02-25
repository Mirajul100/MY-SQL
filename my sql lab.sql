create database University;
use University;

drop database University;

create table classroom(
building varchar(50),
room_number varchar(10),
capacity int,
primary key (building,room_number)
);

insert into classroom
(building , room_number , capacity )
values 
("AB-4" , "G-17" , 25);

select * from classroom;

create table department(
dept_name varchar(30) primary key,
building varchar (50),
budget int
);

insert into department 
(dept_name,building,budget)
values
("CSE" , "AB-4" , 100);

select * from department;

drop table department; 

create table course(
course_id int primary key,
title varchar (30),
dept_name varchar (30),
credits int,
foreign key (dept_name) references department (dept_name)
);

insert into course 
(course_id,title,dept_name,credits)
values 
(111,"DBMS" , "CSE" , 3);

select * from course;

create table section(
course_id int,
sec_id int,
semester varchar(30),
year int,
building varchar(50),
room_number varchar(10),
time_slot_id int,
primary key(course_id , sec_id , semester , year),
foreign key (course_id) references course (course_id),
foreign key (building , room_number) references classroom (building , room_number)
);

insert into section 
values
(111,222,"spring",2025,"AB-4","G-17",8);

select * from section;

drop table section;

create table instructor (
id int primary key,
name varchar(50),
dept_name varchar(30),
salary bigint,
foreign key (dept_name) references department (dept_name)
);

insert into instructor
values
(333,"anik","CSE" , 200000);

select * from instructor;

create table Teaches(
id int,
course_id int,
sec_id int,
semester varchar(30),
year int,
primary key (id , course_id , sec_id , semester , year), 
foreign key (course_id , sec_id , semester , year)
references section (course_id , sec_id , semester , year),
foreign key (id) references instructor (id)
);

insert into Teaches
values
(333,111,222,"spring",2025);

select * from Teaches;

drop table Teaches;

create table advisor(
s_id int,
i_id int,
primary key (s_id , i_id),
foreign key (i_id) references instructor (id)
);

insert into advisor
values 
(555,333);

select * from advisor;

create table Student(
id int primary key,
name varchar (50),
dept_name varchar (30),
foreign key (dept_name) references department (dept_name)
);

insert into Student
values 
(555,"siam","CSE");

select * from Student;

create table takes (
id int,
course_id int,
sec_id int,
semester varchar(30),
year int,
grade varchar(2),
primary key (id , course_id , sec_id , semester , year),
foreign key (course_id , sec_id , semester , year) references section (course_id , sec_id , semester , year),
foreign key (id) references Student (id)
);

insert into takes
values
(555,111,222,"spring",2025,"A+");

select * from takes;







