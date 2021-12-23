public class KhachHang {
    String ten;
    String ngay_sinh;
    String dia_chi;
    String anh;

    public KhachHang() {
    }

    public KhachHang(String ten, String ngay_sinh, String dia_chi, String anh) {
        this.ten = ten;
        this.ngay_sinh = ngay_sinh;
        this.dia_chi = dia_chi;
        this.anh = anh;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getNgay_sinh() {
        return ngay_sinh;
    }

    public void setNgay_sinh(String ngay_sinh) {
        this.ngay_sinh = ngay_sinh;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    @Override
    public String toString() {
        return "KhachHang{" +
                "ten='" + ten + '\'' +
                ", ngay_sinh='" + ngay_sinh + '\'' +
                ", dia_chi='" + dia_chi + '\'' +
                ", anh='" + anh + '\'' +
                '}';
    }
}
