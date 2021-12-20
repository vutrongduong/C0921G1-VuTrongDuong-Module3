package Impl;

import model.Account;

import java.sql.*;

public class LoginImpl {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "12345678";
    private static final String LOGIN = "SELECT * FROM login where `user`=? and pass=?";

    static public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public Account login(String user,String pass) {
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(LOGIN);
            ps.setString(1,user);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getString(1), rs.getString(2));
                return account;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        LoginImpl login =new LoginImpl();
//       login.login("admin","admin");
//        System.out.println(login.login("admin","admin"));
//    }
}
