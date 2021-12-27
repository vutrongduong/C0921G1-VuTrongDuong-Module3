package bean;

public class Customer extends Person {
    private int loaiKhach;
    private String diaChi;

    public Customer() {
    }

    public Customer(int maSo, String hoTen, String ngaySinh, String gioiTinh, String soCmnd,
                    String soDienThoai, String email, int loaiKhach, String diaChi) {
        super(maSo, hoTen, ngaySinh, gioiTinh, soCmnd, soDienThoai, email);
        this.loaiKhach = loaiKhach;
        this.diaChi = diaChi;
    }

    public int getLoaiKhach() {
        return loaiKhach;
    }

    public void setLoaiKhach(int loaiKhach) {
        this.loaiKhach = loaiKhach;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "loaiKhach='" + loaiKhach + '\'' +
                ", diaChi='" + diaChi + '\'' +
                '}';
    }
}
