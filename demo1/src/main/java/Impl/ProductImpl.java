package Impl;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductImpl implements IProduct {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "12345678";
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM products";
    private static final String DELETE_PRODUCT = "DELETE  FROM products WHERE id = ?";
    private static final String ADD_PRODUCT = "INSERT INTO products VALUES (?,?,?,?,?,?,?)";
    private static final String EDIT_PRODUCT = "UPDATE products \n" +
            "SET product_code = ?,product_name = ?,product_price =?,product_amuont =?,product_description = ?,product_status =?\n" +
            "WHERE id = ?;";
    private static final String GET_PRODUCT = "SELECT * FROM products WHERE id = ?";

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

    @Override
    public List<Product> pindAllProduct() {
        List<Product> productList = new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_PRODUCT);
            while (rs.next()) {
                int id = rs.getInt(1);
                String code = rs.getString(2);
                String name = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String description = rs.getString(6);
                String status = rs.getString(7);
                productList.add(new Product(id, code, name, price, amount, description, status));
            }
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return productList;
    }

    public void deleteProduct(String id) {
        Connection connection = getConnection();
        try {
            PreparedStatement stmt = connection.prepareStatement(DELETE_PRODUCT);
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ProductImpl product = new ProductImpl();
//        for (Product e : product.pindAllProduct()) {
//            System.out.println(e);
//        }
//        System.out.println(product.getProductID("1"));
    }

    public void addProduct(Product product) {
        ProductImpl product1 = new ProductImpl();
        List<Product> productList = product1.pindAllProduct();
        int id = 0;
        for (Product e : productList) {
            id = e.getId();
        }
        id = id + 1;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(ADD_PRODUCT)) {
            ps.setString(1, Integer.toString(id));
            ps.setString(2, product.getCode());
            ps.setString(3, product.getName());
            ps.setInt(4, product.getPrice());
            ps.setInt(5, product.getAmount());
            ps.setString(6, product.getDescription());
            ps.setString(7, product.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editProduct(Product product) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(EDIT_PRODUCT)) {
            ps.setString(1, product.getCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getPrice());
            ps.setInt(4, product.getAmount());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getStatus());
            ps.setInt(7, product.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product getProductID(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(GET_PRODUCT);
            ps.setString(1, Integer.toString(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
