create database lilly_test;

use lilly_test;

create table customer(
c_id int AUTO_INCREMENT primary key,
f_name varchar(30) not null,
l_name varchar(30) not null,
phone varchar(10) not null,
email varchar(255) not null,
address varchar(255) not null);

create table flight(
f_id int primary key,
start varchar(255) not null,
dest varchar(255) not null,
departure date not null,
price int not null,
no_of_seats int not null);

create table booking(
t_id int AUTO_INCREMENT primary key,
f_id int not null,
c_id int not null,
foreign key(f_id) references flight(f_id),
foreign key(c_id) references customer(c_id));

insert into customer values
(NULL, 'Abhaya', 'V', '9945817812', 'abh@gmail.com', 'Bengaluru'),
(NULL, 'Puneeth', 'V', '8966780987', 'pv@gmail.com', 'Bengaluru'),
(NULL, 'Rajat', 'S', '8890879000', 'rajaths@gmail.com', 'Rajasthan'),
(NULL, 'Sachin', 'S', '8899009987', 'sachin@gmail.com', 'Mysore');

insert into flight values
(101, 'Bengaluru', 'Rajasthan', '2022-09-06', 10000, 100),
(103, 'Mysore', 'Bengaluru', '2022-09-08', 15000, 150),
(105, 'Rajasthan', 'Mysore', '2022-09-11', 20000, 200),
(106, 'Bengaluru', 'Mysore', '2022-09-12', 10000, 130);

insert into booking values
(NULL,101,1),
(NULL,105,1),
(NULL,103,4),
(NULL,106,4);

alter table booking rename column f_id to F_id;

create view customerdetails as
select c.c_id, c.f_name,c.l_name, f.f_id, f.dest, f.start, f.price, f.departure
from customer c, flight f, booking b
where c.c_id = b.c_id AND f.f_id=b.F_id;

create view cust_per_flight as
select f.f_id,count(b.F_id) from flight f, booking b where f.f_id=b.F_id group by b.F_id;

create view per_flight_revenue as
select f.f_id, f.price * count(b.F_id) as revenue
from flight f, booking b
where f.f_id = b.F_id
GROUP BY b.F_id;

adadfa
