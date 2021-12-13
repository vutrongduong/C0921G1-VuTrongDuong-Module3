use furama;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_va_ten RLIKE '^[HTK]')
        AND (CHAR_LENGTH(ho_va_ten) <= 15);
-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.        
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
-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
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
-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,hop_dong_chi_tiet) 
--  tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
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
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)      
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
-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách 
-- hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
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
-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
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
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(ngay_lam_hop_dong) thang,
    COUNT(MONTH(ngay_lam_hop_dong)) so_luong_khach_hang
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY MONTH(ngay_lam_hop_dong);
-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, 
-- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem)
SELECT 
    hop_dong.ma_hop_dong,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    tien_dat_coc,
    SUM(IFNULL(so_luong, 0)) so_luong_dich_vu_di_kem
FROM
    hop_dong
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
GROUP BY ma_hop_dong;
-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    ten_loai_khach = 'Diamond'
        AND (dia_chi LIKE '%Vinh'
        OR dia_chi LIKE '%Quảng Ngãi');
-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT 
    hd.ma_hop_dong,
   nv.ho_va_ten,
    kh.ho_va_ten,
    kh.so_dien_thoai,
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    SUM(ifnull(hdct.so_luong,0)) so_luong_dich_vu_di_kem,
    tien_dat_coc
FROM
    hop_dong hd
  JOIN
   nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu 
    
      left join
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE
   hd.ma_hop_dong IN (SELECT 
            ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(ngay_lam_hop_dong) BETWEEN 10 AND 12)
                AND YEAR(ngay_lam_hop_dong) = 2020)
        AND hd.ma_hop_dong NOT IN (SELECT 
            ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6)
                AND YEAR(ngay_lam_hop_dong) = 2021)
GROUP BY ma_hop_dong;
-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 
    dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, SUM(so_luong)
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY ma_dich_vu_di_kem 
having sum(so_luong)>= (select max(so_luong) from hop_dong_chi_tiet);
-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem)
select hd.ma_hop_dong,ten_loai_dich_vu,ten_dich_vu_di_kem,count(dvdk.ma_dich_vu_di_kem)so_lan_su_dung
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
group by ten_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem)=1
order by ma_hop_dong;
-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021
select nv.ma_nhan_vien,ho_va_ten,ten_trinh_do,ten_bo_phan,dia_chi
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do=td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan=bp.ma_bo_phan
join vi_tri vt on vt.ma_vi_tri=nv.ma_vi_tri
join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
group by hd.ma_nhan_vien
having (count(hd.ma_nhan_vien)<=3);
-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete 
from nhan_vien nv
where nv.ma_nhan_vien not in (select ma_nhan_vien from hop_dong);
-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với.Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ
update khach_hang
set ma_loai_khach=1
where ma_loai_khach!=1 and ma_khach_hang in (select kh.ma_khach_hang
from khach_hang kh 
join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by kh.ma_khach_hang
having (SUM(ifnull(dv.chi_phi_thue,0) + ifnull(dvdk.gia,0)* ifnull(hdct.so_luong,0))>=1000000));
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng)
SET FOREIGN_KEY_CHECKS=0;
delete 
from khach_hang
where ma_khach_hang in (select ma_khach_hang 
from hop_dong
where year(ngay_lam_hop_dong)<2021);
-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi
-- select dvdk.ma_dich_vu_di_kem , ten_dich_vu_di_kem 
-- from dich_vu_di_kem dvdk
-- join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
-- join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
-- where so_luong >=10 and year(hd.ngay_lam_hop_dong)=2020;
update dich_vu_di_kem
set gia=gia*2
where ma_dich_vu_di_kem in (select dvdk.ma_dich_vu_di_kem 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
where so_luong >=10 and year(hd.ngay_lam_hop_dong)=2020);
-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien id ,ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang id ,ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang



	

                



          









    
    
    



        



