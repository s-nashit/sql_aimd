create database patna;
use patna;
create table student(
s_id int not null auto_increment primary key,
name text,
age int,
gender text,
salary int);
insert into student
(name, age, gender, salary)
values
('shrey verma', 23, 'Male', 54000),
('amit kumar', 25, 'Male', 44000),
('tannu kumari', 20, 'Female', 61000),
('smriti ranjan', 21, 'Female', 48000),
('ashutosh kumar', 21, 'Male', 55000),
('mukesh Vishwas', 22, 'Male', 440000),
('ranjit kumar', 26, 'Male', 51000);

select count(distinct gender) as gen from student;
select count(name) from student;
select * from student;
select max(age) as AGE_HIGH from student;
select max(salary) from student;
select min(salary) as MIN_SALARY from student;
select sum(salary) as total from student;
select avg(salary) from student;

select * from student;
select * from student where name regexp 'an';
select * from student where name regexp '^s';
select * from student where name regexp 'ar$';
select * from student where name regexp 'verma | Kapoor';
select * from student where name regexp '[v-z]';