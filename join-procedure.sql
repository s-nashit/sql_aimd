create database a3;
use a3;
create table employees(
emp_id int auto_increment primary key not null,
emp_name text, dept_id int);

create table departments (
dept_id int auto_increment not null primary key,
dept_name text);

insert into employees(emp_name, dept_id)
values
('nashit', 1),
('shrey', 2),
('amit', 1),
('rahul', 5);

insert into departments(dept_name)
values
('IT'),
('Operations'),
('Accounts');

-- inner join
select employees.emp_id, employees.emp_name, departments.dept_name
from employees inner join
departments on employees.dept_id =departments.dept_id;

-- left join

select employees.emp_id, employees.emp_name, departments.dept_name
from employees left join
departments on employees.dept_id =departments.dept_id;

-- right join
select employees.emp_id, employees.emp_name, departments.dept_name
from employees right join
departments on employees.dept_id =departments.dept_id;

-- full outer join
select employees.emp_id, employees.emp_name, departments.dept_name
from employees left join
departments on employees.dept_id =departments.dept_id
union
select employees.emp_id, employees.emp_name, departments.dept_name
from employees right join
departments on employees.dept_id =departments.dept_id;

-- cross join
select employees.emp_id, employees.emp_name, departments.dept_name
from employees cross join
departments ;

create table emp
(emp_id int auto_increment not null primary key,
emp_name text, manager_id int);

insert into emp(emp_name, manager_id)
values
('nashit', null),
('shrey', 1),
('amit', 1),
('rahul', 2);

select e1.emp_id as EmployeeID, e1.emp_name as EmployeeName, e1.emp_name as ManagerName
from
emp e1
inner join
emp e2 on e1.manager_id=e2.emp_id;

create table results
(id int not null auto_increment primary key,
name text, marks int);

insert into results(name, marks)
values
('shivam', 12),
('shrey', 98),
('amit', 67),
('smriti', 91),
('rahul', 58);

-- case
select
id, name, marks,
case
when marks<40 then 'FAIL'
when marks between 40 and 70 then 'PASS'
when marks > 70 then 'DISTINCTION'
else 'unknown'
end as statuse
from results;

-- iteration

delimiter $$
create procedure adddd()
begin
declare i int default 1;
declare total int default 0;
while i<=10 do
set total = total+i;
set i = i+1;
select total as totalsum;
end while;

select total as totalsum;
end $$
delimiter ;

call adddd()

