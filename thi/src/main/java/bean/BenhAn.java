package bean;

public class BenhAn {
    String id;
    BenhNhan benhNhan;
    private String ngayNhapVien;
    private String ngayRaVien;
    private String lyDo;

    public BenhAn() {
    }

    public BenhAn(String id, BenhNhan benhNhan, String ngayNhapVien, String ngayRaVien, String lyDo) {
        this.id = id;
        this.benhNhan = benhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayRaVien = ngayRaVien;
        this.lyDo = lyDo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BenhNhan getBenhNhan() {
        return benhNhan;
    }

    public void setBenhNhan(BenhNhan benhNhan) {
        this.benhNhan = benhNhan;
    }

    public String getNgayNhapVien() {
        return ngayNhapVien;
    }

    public void setNgayNhapVien(String ngayNhapVien) {
        this.ngayNhapVien = ngayNhapVien;
    }

    public String getNgayRaVien() {
        return ngayRaVien;
    }

    public void setNgayRaVien(String ngayRaVien) {
        this.ngayRaVien = ngayRaVien;
    }

    public String getLyDo() {
        return lyDo;
    }

    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }

    @Override
    public String toString() {
        return "BenhAn{" +
                "id='" + id + '\'' +
                ", benhNhan=" + benhNhan +
                ", ngayNhapVien='" + ngayNhapVien + '\'' +
                ", ngayRaVien='" + ngayRaVien + '\'' +
                ", lyDo='" + lyDo + '\'' +
                '}';
    }
}
