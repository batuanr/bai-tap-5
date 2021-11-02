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

create unique index codeID on Products (productCode);

create index nameID on Products (productName, productPrice);

explain select * from Products where productName = '';

explain select * from Products where productCode = 1;


create view product_view as
    select productCode, productName, productPrice
from Products;

select * from product_view;


create or replace view product_view as
    select productCode, productName
from Products;

select * from demo1.product_view;

drop view product_view;


create procedure getAllProduct()
begin
    select * from Products;
end;

create procedure getNewProduct(
code int,name varchar(30), price int, description varchar(50), status int)
begin
    insert into Products ( productCode, productName, productPrice, productDescription, productStatus)
    value (code, name, price, description, status);
end;

create procedure edit(idIn int, newName varchar(30))
begin
    update  Products
    set productName = newName
    where id = idIn;
end;

call edit(1, 'milk');

call getAllProduct();

create procedure delete1(idIN int)
begin
    delete from Products
        where id = idIN;
end;

call delete1(1);