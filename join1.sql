create database a;
use a;
create table department(
dept_id int auto_increment primary key,
dept_name text not null
);
create table student(
id int auto_increment primary key,
name varchar(30),
dept_id int,
stipend decimal(5,2),
enrolment date,
foreign key(dept_id) references department(dept_id)
);

insert into department(dept_name) values 
('civil'), ('electrical'), ('mechanical');

insert into department(dept_name) values ("IT");

insert into student(name, dept_id, stipend, enrolment)
values
("nashit", 2, 623.34, "2022-01-01"),
("shivam", 1, 201.21, "2023-06-05"),
("prity", 2, 319.21, "2023-12-05"),
("sharavan", 3, 401.21, "2020-06-12"),
("kashish", 3, 609.21, "2024-06-05"),
("piyush", 2, 691.21, "2024-12-05"),
("shrey", 1, 091.21, "2024-03-05"),
("amit", 1, 201.21, "2024-02-05"),
("tannu", 3, 691.21, "2023-06-01");




select * from department;
select * from student; 

select s.name, s.stipend,  d.dept_name 
from student s inner join
department d on s.dept_id=d.dept_id;

-- select s.name, s.stipend, d.dept_name 
-- from student s left join
-- department d on s.dept_id=d.dept_id;
