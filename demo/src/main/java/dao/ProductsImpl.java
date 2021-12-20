package dao;

import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductsImpl implements IProducts {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "12345678";
    private static final String SELECT_ALL_USERS = "SELECT * FROM demo.products";

     public Connection getConnection() {
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

    @Override
    public List<Products> selectAllUsers() {
        List<Products> products=new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_USERS);
            while (rs.next()) {
                int id = rs.getInt(1);
                String code = rs.getString(2);
                String name = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String description = rs.getString(6);
                String status = rs.getString(7);
                System.out.println(status);
                products.add(new Products(id,code,name,price,amount,description,status));
            }
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;
    }
    
    public static void main(String[] args) {
        ProductsImpl products=new ProductsImpl();
        for (Products e: products.selectAllUsers()) {
            System.out.println(e.toString());
        }
    }
}
