use a;
explain select * from department;
-- partition
use a;
drop table sales;
create table sales
(id int,
sale_date date, amount float);
insert into sales(id, sale_date, amount) values
(1,'2025-02-01', 143.23),
(2,'2025-02-02', 100.25),(3,'2025-02-03', 130.25),(4,'2025-02-04', 132.25),(5,'2025-02-05', 128.15),
(6, '2025-02-06', 140.22),(7, '2025-02-07', 160.25),(8, '2025-02-08', 142.05);
insert into sales(id, sale_date, amount) values
(9,'2024-02-01', 43.23),
(10,'2024-02-02', 90.25),(11,'2024-02-03', 30.25),(12,'2024-02-04', 32.25);
insert into sales(id, sale_date, amount) values
(13,'2023-02-01', 53.23),
(14,'2023-02-02', 60.25),(15,'2023-02-03', 50.25),(16,'2023-02-04', 52.25);
select day(sale_date), amount from sales;

-- range partition
alter table sales
partition by range(year(sale_date))(
partition p23 values less than (2024),
partition p24 values less than (2025),
partition p25 values less than (2026)
);

show create table sales;
explain select * from sales;
select * from sales where sale_date between '2024-01-01' and '2024-12-12';
drop table sales;
-- list partitioning
create table sales 
(id int, sale_date date, product_id int, amount float)
partition by list(product_id)
(
partition p1 values in (1,2),
partition p2 values in (3,4),
partition p3 values in (5,6));

insert into sales(id, sale_date, product_id, amount) values
(1,'2025-02-01',1,  143.23),
(2,'2025-02-02',2,  100.25),(3,'2025-02-03',3,  130.25),(4,'2025-02-04',1,  132.25),(5,'2025-02-05',1,  128.15),
(6, '2025-02-06',1,  140.22),(7, '2025-02-07',3,  160.25),(8, '2025-02-08',2,  142.05);

explain select * from sales;

select table_name, partition_name, subpartition_name, partition_method,
partition_method, table_rows
from information_schema.partitions
where table_name= 'sales';
drop table sales;

-- hash partition
create table sales
(id int, sale_date date, product_id int, amount float)
partition by hash (product_id) partitions 3;

-- key partition
drop table sales;

create table sales
(id int, sale_date date, product_id int, amount float)
partition by key(product_id) partitions 3;
