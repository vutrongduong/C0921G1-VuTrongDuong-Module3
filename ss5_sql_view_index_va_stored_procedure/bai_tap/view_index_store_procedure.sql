-- Bước 1: Tạo cơ sở dữ liệu demo
create database demo;
use demo;
-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table products(
id int primary key ,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amuont int,
product_description varchar(45),
product_status varchar(45)
);
-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products values(1,'KR','Iphone 13',1200,10,'black','100%'),
(2,'US','Iphone 12',1000,20,'white','99%'),
(3,'JP','Samsung S20',1100,15,'blue','100%'),
(4,'VN','Iphone 11',900,30,'red','98%');
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
create unique index idx_1
on products(product_code) ;
explain select * from products where product_code='VN'; 
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index idx_2
on products(product_code,product_price);
explain select * from products where product_code='VN' and product_price = 1200; 
show index from products;
-- So sánh câu truy vấn trước và sau khi tạo index
drop index idx_1 on products;
drop index idx_2 on products;
explain select * from products where product_code='VN'; 
explain select * from products where product_code='VN' and product_price = 1200; 
-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
select product_code,product_name,product_price,product_status
from products;
select * from products_view;
-- Tiến hành sửa đổi view
create or replace view products_view as
select product_code,product_name,product_price,product_amuont,product_status
from products;
select * from products_view;
-- Tiến hành xoá view
drop view products_view;
-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_product ()
begin 
select * from products;
end; //
 delimiter ;
 call get_product();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product (id int ,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amuont int,
product_description varchar(45),
product_status varchar(45))
begin 
insert into products values (id,product_code,product_name,product_price,product_amuont,product_description,product_status);
end; //
delimiter ;
call add_product(5,'AU','Iphone X',600,20,'white','98%');
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product (id int ,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amuont int,
product_description varchar(45),
product_status varchar(45))
begin 
update products
set product_code=product_code,product_name=product_name,product_price=product_price,product_amuont=product_amuont,product_description=product_description,product_status=product_status
where products.id=id;
end; //
delimiter ;
call edit_product(5,'AU','Iphone X',600,20,'white','100%');
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product (id int)
begin 
delete 
from products
where products.id=id;
end; //
delimiter ;
call delete_product(5);


