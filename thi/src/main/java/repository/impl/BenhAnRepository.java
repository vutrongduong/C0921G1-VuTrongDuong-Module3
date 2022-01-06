package repository.impl;

import bean.BenhAn;
import bean.BenhNhan;
import repository.DBConnection;
import repository.IBenhAnRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepository implements IBenhAnRepository {
    private static final String SELECT_ALL_BENH_AN = "SELECT * FROM benh_an join benh_nhan on benh_an.benh_nhan_id=benh_nhan.benh_nhan_id where flag=1";
    private static final String SELECT_ALL_BENH_NHAN = "SELECT * FROM benh_nhan";
    private static final String DELETE_CUSTOMER = "update benh_an set flag=0 where benh_an_id=?;  ";
    private static final String EDIT_BENH_AN = " update benh_nhan join benh_an on benh_an.benh_nhan_id=benh_nhan.benh_nhan_id set ten =?,ngay_nhap_vien=?,ngay_ra_vien=?,ly_do=? where benh_an_id=? and flag=1; ";
    private static final String GET_BENH_AN = " SELECT * FROM benh_an join benh_nhan on benh_an.benh_nhan_id=benh_nhan.benh_nhan_id where flag=1 and benh_an_id= ? ";

    public List<BenhAn> display() {
        List<BenhAn> benhAnList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_BENH_AN);
            while (rs.next()) {
                String id = rs.getString("benh_an_id");
                BenhNhan benhNhan = new BenhNhan(rs.getString("benh_nhan_id"), rs.getString("ten"));
                String ngayNhapVien = rs.getString("ngay_nhap_vien");
                String ngayRaVien = rs.getString("ngay_ra_vien");
                String lyDo = rs.getString("ly_do");
                benhAnList.add(new BenhAn(id, benhNhan, ngayNhapVien, ngayRaVien, lyDo));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return benhAnList;
    }

    public List<BenhNhan> displayBenhNhan() {
        List<BenhNhan> benhNhanList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_BENH_NHAN);
            while (rs.next()) {
                String id = rs.getString("benh_nhan_id");
                String name = rs.getString("ten");
                benhNhanList.add(new BenhNhan(id, name));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return benhNhanList;
    }

    public void edit(BenhAn benhAn) throws SQLException {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(EDIT_BENH_AN);
            ps.setString(1, benhAn.getBenhNhan().getTen());
            ps.setString(2, benhAn.getNgayNhapVien());
            ps.setString(3, benhAn.getNgayRaVien());
            ps.setString(4, benhAn.getLyDo());
            ps.setString(5, benhAn.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BenhAn searchId(String id) {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(GET_BENH_AN);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new BenhAn(
                        rs.getString("benh_an_id"),
                        new BenhNhan(rs.getString("benh_nhan_id"), rs.getString("ten")),
                        rs.getString("ngay_nhap_vien"),
                        rs.getString("ngay_ra_vien"),
                        rs.getString("ly_do"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public void delete(String id) {
        try {
            PreparedStatement stmt = DBConnection.connection.prepareStatement(DELETE_CUSTOMER);
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public static void main(String[] args) {
        BenhAnRepository e = new BenhAnRepository();
//        for (BenhAn ele : e.display()
//        ) {
//            System.out.println(ele);
//        }
        System.out.println(e.searchId("1"));
    }
}
