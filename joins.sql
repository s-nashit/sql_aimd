create database joins1;
use joins1;
create table departments
(dept_id int auto_increment not null primary key,
dept_name text);

create table students
(s_id int auto_increment not null primary key,
name text,
dept_id int,
age int,
phone int);

drop table students;

insert into departments(dept_name)
values
('mechanical'), ('electrical'), ('civil'), ('CSE');

insert into students(name, dept_id, age, phone)
values
("john", 5, 32,50000),
("shivam", 4, 21,21000),
("prity", 3, 21, 44000),
("sharavan", 1,20, 34000),
("kashish", 5,17,32000),
("piyush", 1,21, 26000),
("shrey", 1,23, 32000),
("amit", 5,24, 43000),
("tannu", 3,21, 40000);

alter table students add foreign key(dept_id)
references departments(dept_id);
SET FOREIGN_KEY_CHECKS=0;
select * from students;
select * from departments;

select s.name, d.dept_name from students s
inner join departments d on s.dept_id=d.dept_id;

select s.name, d.dept_name from students s
left join departments d on s.dept_id=d.dept_id;

select s.name, d.dept_name from students s
right join departments d on s.dept_id=d.dept_id;

select s.name, d.dept_name from students s
cross join departments d;
