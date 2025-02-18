-- indexing
use a;
drop table employee;
create table employee
(id int not null auto_increment primary key,
first_name varchar(30),last_name varchar(30), 
dept varchar(30), salary decimal(8,2), hire_date date);
insert into employee (first_name, last_name, dept, salary, hire_date)
values 
('vivek', 'kumar', 'Accounts', 563412.65, '2022-06-03'),
('rakesh', 'kumar', 'HR', 234112.65, '2025-01-02'),
('piyush', 'kumar', 'IT', 67512.65, '2023-06-03'),
('vikash', 'saxena', 'HR', 63412.65, '2024-01-03'),
('sudarshan', 'kumar', 'IT', 98412.65, '2022-06-03'),
('sharavan', 'kumar', 'Accounts', 63412.65, '2022-04-07'),
('shrey', 'kumar', 'IT', 763412.65, '2022-07-12'),
('rahul', 'kumar', 'Accounts', 563412.65, '2022-08-11'),
('rajesh', 'ranjan', 'IT', 643412.65, '2023-08-09'),
('ranjan', 'singh', 'HR', 863412.65, '2023-09-07');
select * from employee where last_name='kumar';
-- single column
create index idx_lname on employee(last_name); 
show index from employee;

-- composite index

create index idx_comp on employee(dept, salary);

explain select * from employee where last_name = 'kumar';

select * from employee;

create view emp_data as
select id, concat(first_name, last_name) as emp_name, dept, salary, hire_date
from employee where salary>=70000
order by dept;

create view accounts_dept as
select id, concat(first_name, ' ' , last_name) as emp_name,dept, salary, hire_date
from employee where dept='Accounts' 
order by salary;

select * from emp_data;

select * from accounts_dept;
