-- tcl
drop table sales;
use a;
create table sales
(id int,
sale_date date, product_id int, amount float);
insert into sales(id, sale_date, product_id, amount) values
(1,'2025-02-01', 1, 143.23),
(2,'2025-02-02',2,  100.25),(3,'2025-02-03',2,  130.25),(4,'2025-02-04',1,  132.25),(5,'2025-02-05',2, 128.15),
(6, '2025-02-06',1,  140.22),(7, '2025-02-07',3,  160.25),(8, '2025-02-08',3,  142.05);
insert into sales(id, sale_date,product_id, amount) values
(9,'2024-02-01', 2, 43.23),
(10,'2024-02-02',2,  90.25),(11,'2024-02-03',1,  30.25),(12,'2024-02-04', 3, 32.25);
insert into sales(id, sale_date,product_id, amount) values
(13,'2023-02-01',1,  53.23),
(14,'2023-02-02',3, 60.25),(15,'2023-02-03',2,  50.25),(16,'2023-02-04',1, 52.25);

select * from sales;

-- update sales set amount=999.99 where product_id =2;

savepoint s1;
rollback to s1;
