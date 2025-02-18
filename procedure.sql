use mydb;
select * from emp;
create procedure display_emp()
select * from emp;
call display_emp();

create procedure dis()
select name, age, gender from emp
where salary<=50000;
-- call dis();

delimiter $$
create procedure emp1()
begin
select * from emp
order by name;
end$$
delimiter ;

call emp1();

delimiter $$
create procedure a2()
begin
drop table if exists teacher;
create table if not exists teacher (
id int auto_increment not null primary key,
name text, age int, subject text, salary int
);
insert into teacher(name, age, subject, salary)
values('nashit', 31, 'Python', 60000), ('shrey', 24, 'Java', 45000);
select * from teacher; 
end $$
delimiter ;

call a2();

delimiter $$
create procedure a3(in age_emp int)
begin
select * from emp
where age = age_emp;
end$$
delimiter ;

call a3(27);
create table traine
(id int, name text, age int);

delimiter $$
create procedure new2(
in id int,
in name text,
in age int,
out st_msg text)
begin
insert into traine(id, name, age) values (id, name, age);
if row_count()>1 then
set st_msg = 'inserted';
else
set st_msg = 'error';
end if;
end $$
delimiter ;

set @st_msg = '';
call new1(1,'nashit', 31, @st_msg);
select * from trainer;
select @st_msg as status;