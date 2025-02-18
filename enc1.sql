create database ab;
use ab;
create table users
(id int auto_increment not null primary key,
name text, password varbinary(255) not null);
insert into users(name, password) values('nashit', '1234');
select * from users;
set @encryption_key = left('a', 8);
insert into users (name, password) values
('shivam', aes_encrypt('1234', @encryption_key));

set @ghalat_key = 'kchh bhi';
select * from users;
select name , cast(aes_decrypt(password, @encryption_key) as char) from users;

select name , cast(aes_decrypt(password, @ghalat_key) as char) from users;
