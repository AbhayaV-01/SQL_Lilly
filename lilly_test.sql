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