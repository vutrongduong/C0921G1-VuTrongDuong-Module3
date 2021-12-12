use quan_ly_ban_hang ;
insert into customer values (1,'Minh Quan',10), 
(2,'Ngoc Oanh',20), 
(3,'Hong Ha',50);
insert into `order` values (1,1,'2006/03/21',Null), 
(2,2,'2006/03/23',Null), 
(3,1,'2006/03/16',Null);
insert into product values (1,'May Giat',3), 
(2,'Tu Lanh',5), 
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
insert into order_detail values (1,1,3), 
(1,3,7), 
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    `order`.oID, `order`.oDate, `order`.oTotalPrice
FROM
    `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    customer.cName, product.pName
FROM
    customer
        JOIN
    `order` ON customer.cID = `order`.cID
        JOIN
    order_detail ON order_detail.oID = `order`.oID
        JOIN
    product ON product.pID = order_detail.pID;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    customer.cName
FROM
    customer
WHERE
    customer.cName NOT IN (SELECT 
            customer.cName
        FROM
            customer
                JOIN
            `order` ON customer.cID = `order`.cID
                JOIN
            order_detail ON order_detail.oID = `order`.oID
                JOIN
            product ON product.pID = order_detail.pID);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán 
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    `order`.oID,
    `order`.oDate,
    SUM(order_detail.odQTY * product.pPrice) as gia_tien
FROM
    `order`
        JOIN
    order_detail ON order_detail.oID = `order`.oID
        JOIN
    product ON product.pID = order_detail.pID
GROUP BY  oID;
    



