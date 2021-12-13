use furama;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_va_ten RLIKE '^[HTK]')
        AND (LENGTH(ho_va_ten) <= 16)tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”
SELECT 
    *
FROM
   khach_hang
WHERE
    (ROUND(DATEDIFF(CURDATE(), khach_hang.ngay_sinh) / 365,
            0) <= 50
        AND ROUND(DATEDIFF(CURDATE(), khach_hang.ngay_sinh) / 365,
            0) >= 18)
        AND ((khach_hang.dia_chi LIKE '%Đà Nẵng%')
        OR (khach_hang.dia_chi LIKE '%Quảng Trị%'));
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_va_ten,
    COUNT(hop_dong.ma_khach_hang)so_lan_dat_phong
FROM
    khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        JOIN
    hop_dong ON khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
WHERE
    loai_khach.ma_loai_khach = 1
GROUP BY khach_hang.ma_khach_hang
order by   COUNT(hop_dong.ma_khach_hang);
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
--  hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
 SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_va_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    SUM(ifnull(dich_vu.chi_phi_thue,0) + ifnull(dich_vu_di_kem.gia,0)* ifnull(hop_dong_chi_tiet.so_luong,0) ) AS tong_tien
FROM
    khach_hang
        LEFT JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
        LEFT JOIN
    loai_dich_vu ON dich_vu.ma_dich_vu =loai_dich_vu.ma_loai_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY ma_hop_dong
ORDER BY ma_khach_hang ASC,ma_hop_dong DESC;
-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)      
SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE
    dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            MONTH(hop_dong.ngay_lam_hop_dong) BETWEEN 1 AND 3)
GROUP BY dich_vu.ten_dich_vu;
-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.so_nguoi_toi_da,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE
    dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            year(hop_dong.ngay_lam_hop_dong)=2021)
GROUP BY dich_vu.ten_dich_vu;
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cách 1 
SELECT DISTINCT
    ho_va_ten
FROM
    khach_hang
GROUP BY ho_va_ten;
-- cách 2
SELECT 
    ho_va_ten
FROM
    khach_hang
GROUP BY ho_va_ten;
-- cách 3
SELECT 
    ho_va_ten
FROM
    khach_hang kh
GROUP BY ho_va_ten
HAVING COUNT(DISTINCT (ho_va_ten)) = 1;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
-- select month(ngay_lam_hop_dong) thang, count(ma_khach_hang) so_luong_khach_hang
-- from hop_dong
-- where year(ngay_lam_hop_dong)=2021 and month(ngay_lam_hop_dong) between 1 and 12
-- group by ma_khach_hang
-- order by month(ngay_lam_hop_dong)
SELECT 
    MONTH(ngay_lam_hop_dong) thang,
    COUNT(MONTH(ngay_lam_hop_dong)) so_luong_khach_hang
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY MONTH(ngay_lam_hop_dong);
-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem)






    
    
    



        



