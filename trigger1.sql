create database stock;
use stock;
create table products
(product_id int auto_increment not null primary key,
product_name text, price float);
create table stock
(stock_id int primary key,
product_id int, quantity int,
foreign key(product_id) references products(product_id));

delimiter //
create trigger before_stock_insert
before insert on stock
for each row
begin
declare current_stock int;
select quantity into current_stock
from stock
where product_id=new.product_id;

if current_stock is not null then
set new.quantity =new.quantity+current_stock;
end if;
end;
//
delimiter ;

delimiter //
create trigger before_stock_update
before update on stock
for each row
begin
declare current_stock int;
select quantity into current_stock
from stock
where product_id=new.product_id and stock_id != old.stock_id;

if current_stock is not null then
set new.quantity =new.quantity+current_stock;
end if;
end;
//
delimiter ;

delimiter //
create trigger before_stock_delete
before delete on stock
for each row
begin
update stock
set quantity = quantity - old.quantity
where product_id = old.product_id;
end;
//
delimiter ;

insert into products(product_name, price) values
('pen', 23.21), ('pencil', 12.21);
insert into stock(stock_id, product_id, quantity) values
(3, 1, 120), (4, 2, 200);

select * from products;
select * from stock;
update stock set quantity = 100 where product_id=1;
delete from stock where product_id=2;
