-- DML : Manipulation: Data :  INSTANCE
-- insert, update, delete, lock, call, plan explain

use mydb;
create table student
(id int,
name text not null,
city varchar(30) default 'Patna',
age int unique);

insert into student(name, city, age)
values('komal', 'delhi', 18);

insert into student(id, name, city, age)
values(21, 'nashit', 'delhi', 30);
select * from student;

insert into student(id, name, age)
values(22, 'sharavan', 20);

create table emp(
id int not null auto_increment primary key,
name text not null, age int,
check (age>=18)
);

create table emp(
id int not null auto_increment primary key,
name text not null, age int,
check (age>=18)
)
auto_increment= 243;

create table emp(
id int not null auto_increment primary key,
name text not null, age int, created timestamp default current_timestamp,
check (age>=18)
);

insert into emp(name, age) values('nashit', 31),('komal', 20), ('shivam', 22), ('piyush', 19), ('sharavan', 19);
select * from emp;
insert into emp(name, age) values('Prince', 21);
insert into emp(name, age) values('Komal', 17);
drop table emp;
update emp
set name = 'BILL GATES', age= 55
where id= 7;
update emp set name = 'Ninja Hathori'
where age=19;
SET SQL_SAFE_UPDATES = 0;
delete from emp where age<=20;

select * from emp;

create procedure display_emp()
select * from emp;

call display_emp()