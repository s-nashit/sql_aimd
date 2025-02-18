select * from mysql.user;
create database abcd;
use abcd;
create user shivam identified by '1234';
create user 'piyush'@'localhost' identified by '1234';
create user 'komal'@'127.0.0.1' identified by '1234';
grant select, insert on *.* to 'piyush'@'localhost';
create user 'kashish'@'localhost' identified by '1234';
revoke select on *.* from 'piyush'@'localhost';

