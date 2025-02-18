use a;
create table items
(id int not null primary key auto_increment,
name text, price float);
insert into items (name, price)
values('pen', 10.13),('pencil', 4.57);

create table item_changes
(change_id int not null auto_increment primary key,
item_id int,
change_type text,
change_timestamp timestamp default current_timestamp,
foreign key (item_id) references items(id));

delimiter //
create trigger update_items
after update on items
for each row
begin
insert into item_changes (item_id, change_type)
values (NEW.id, 'UPDATE');
end;
//
delimiter ;
select * from items;
select * from item_changes;
update items set price= 10.29 where id = 1;
update items set price = 5.23 where id = 2;