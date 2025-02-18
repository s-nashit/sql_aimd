-- DDL Commands: schema: create, alter, truncate, drop, rename, comment
-- schema : database & tables
create database if not exists mydb;
use mydb;
create table student
(roll_no int,
name text,
mail varchar(25),
dob date,
salary float);

alter table mydb.student
add age int;
alter table student drop column age;
alter table student modify column salary decimal(8,2);
alter table student rename to employee;
alter table employee change roll_no emp_id int;
-- alter table employee rename roll_no to emp_id;
insert into employee
(emp_id, name, mail, dob, salary)
values
(2, 'komal', 'komal@hotmail.com', '2000-08-17', 76854.23),
(3, 'kashish', 'kashish@hotmail.com', '2000-08-17', 76854.23),
(4, 'ritu', 'ritu@hotmail.com', '2000-08-17', 76854.23),
(5, 'prity', 'prity@hotmail.com', '2000-08-17', 76854.23);

truncate table employee;
drop table employee;