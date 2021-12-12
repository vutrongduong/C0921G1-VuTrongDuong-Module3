create database quan_ly_don_dat_hang;

CREATE TABLE quan_ly_don_dat_hang.don_vi_khach_hang (
    ma_don_vi INT primary key,
    ten_don_vi VARCHAR(45),
    dia_chi VARCHAR(45),
    dien_thoai VARCHAR(45)
);
CREATE TABLE quan_ly_don_dat_hang.nguoi_dat (
    ma_nguoi_dat INT primary key,
    ho_ten_nguoi_dat VARCHAR(45)
);
CREATE TABLE quan_ly_don_dat_hang.nguoi_nhan (
    ma_so_nguoi_nhan INT primary key,
    ho_ten_nguoi_nhan VARCHAR(45)
);
CREATE TABLE quan_ly_don_dat_hang.hang (
    ma_hang INT primary key,
    ten_hang VARCHAR(45),
    don_vi_tinh VARCHAR(45),
    mo_ta_hang VARCHAR(45)
);
CREATE TABLE quan_ly_don_dat_hang.nguoi_giao (
    ma_so_nguoi_giao INT primary key,
    ho_ten_nguoi_giao VARCHAR(45)
);
CREATE TABLE quan_ly_don_dat_hang.noi_giao (
    ma_so_ddg INT primary key,
    ten_noi_giao VARCHAR(45)
);



