package service.impl;

import bean.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl {
    private static final String SELECT_ALL_KHACH_HANG = "SELECT * FROM khach_hang";
    private static final String DELETE_KHACH_HANG = "DELETE  FROM khach_hang WHERE id = ?";
    private static final String ADD_KHACH_HANG = "INSERT INTO khach_hang VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String EDIT_KHACH_HANG = "UPDATE khach_hang \n" +
            "SET customer_code = ?,customer_name = ?,customer_price =?,customer_amuont =?,customer_description = ?,customer_status =?\n" +
            "WHERE id = ?;";
    private static final String GET_KHACH_HANG = "SELECT * FROM khach_hang WHERE id = ?";

    public List<Customer> display() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement stmt = Connect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_KHACH_HANG);
            while (rs.next()) {
                int maSo = rs.getInt(1);
                int loaiKhach = rs.getInt(2);
                String hoTen = rs.getString(3);
                String ngaySinh = rs.getString(4);
                String gioiTinh = rs.getString(5);
                String soCmnd = rs.getString(6);
                String soDienThoai = rs.getString(7);
                String email = rs.getString(8);
                String diaChi = rs.getString(9);
                customerList.add(new Customer(maSo, hoTen, ngaySinh, gioiTinh, soCmnd,
                        soDienThoai, email, loaiKhach, diaChi));
            }
            Connect.getConnection().close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customerList;
    }

    public void deleteCustomer(String id) {
        try {
            PreparedStatement stmt = Connect.getConnection().prepareStatement(DELETE_KHACH_HANG);
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerServiceImpl customer = new CustomerServiceImpl();
        for (Customer e : customer.display()) {
            System.out.println(e);
        }
    }

    public void add(Customer customer) {
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        List<Customer> customerList = customerService.display();
        int id = 0;
        for (Customer e : customerList) {
            id = e.getMaSo();
        }
        id = id + 1;
        try (PreparedStatement ps = Connect.getConnection().prepareStatement(ADD_KHACH_HANG)) {
            ps.setString(1, Integer.toString(id));
            ps.setInt(2, customer.getLoaiKhach());
            ps.setString(3, customer.getHoTen());
            ps.setString(4, customer.getNgaySinh());
            ps.setString(5, customer.getGioiTinh());
            ps.setString(6, customer.getSoCmnd());
            ps.setString(7, customer.getSoDienThoai());
            ps.setString(8, customer.getEmail());
            ps.setString(9, customer.getDiaChi());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//
//    public void edit(Customer customer) throws SQLException {
//        try (PreparedStatement ps = Connect.getConnection().prepareStatement(EDIT_KHACH_HANG)) {
//            ps.setString(1, customer.getCode());
//            ps.setString(2, customer.getName());
//            ps.setInt(3, customer.getPrice());
//            ps.setInt(4, customer.getAmount());
//            ps.setString(5, customer.getDescription());
//            ps.setString(6, customer.getStatus());
//            ps.setInt(7, customer.getId());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public Customer search(int id) {
        try {
            PreparedStatement ps = Connect.getConnection().prepareStatement(GET_KHACH_HANG);
            ps.setString(1, Integer.toString(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2),
                        rs.getString(9));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
