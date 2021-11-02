create database demo1;

use demo1;

create table Products (
    id int not null primary key,
    productCode int,
    productName varchar(30),
    productPrice int,
    productAmount int,
    productDescription varchar(50),
    productStatus int
);

