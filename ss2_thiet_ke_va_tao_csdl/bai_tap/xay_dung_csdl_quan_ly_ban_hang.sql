create database quan_ly_ban_hang;
use quan_ly_ban_hang;
CREATE TABLE customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(45),
    cAge INT
);
CREATE TABLE product (
    pID INT PRIMARY KEY,
    pName VARCHAR(45),
    pPrice INT
);
create table `order`(
oID int primary key,
cID int ,
foreign key(cId) references customer(cID),
oDate date,
oTotalPrice int
);
CREATE TABLE order_detail (
    oID INT,
    pID INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES `order` (oID),
    FOREIGN KEY (pID)
        REFERENCES product (pID)
);