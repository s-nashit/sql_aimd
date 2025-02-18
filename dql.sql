-- DQL : Query Language
use mydb;
create table emp(
id int AUTO_INCREMENT PRIMARY KEY,
name text,
age Int,
gender TEXT,
salary decimal(8,2));

insert into emp(name, age, gender, salary)
values('sharavan', 20, 'Male', 54543.23);
select * from emp;
insert into emp(name, age, gender, salary)
values
('shivam', 27, 'Male', 44543.23),
('ritu', 23, 'Female', 64543.23),
('prity', 26, 'Female', 34543.23),
('seema', 28, 'Female', 74543.23),
('piyush', 24, 'Male', 49543.23),
('komal', 27, 'Female', 59543.23),
('kashish', 23, 'Female', 65543.23),
('sudarshan', 29, 'Male', 84543.23);

select * from emp;
select * from emp where gender='Male';
select * from emp where salary>=50000;
select * from emp where age<=25;
