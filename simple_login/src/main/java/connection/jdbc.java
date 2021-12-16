package connection;

import java.sql.*;


public class jdbc {
    String url ="jdbc:mysql://localhost:3306/demo";
    String user = "root";
    String password ="12345678";
    public  static Connection getJDBCconnection(String url,String user,String password){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return  DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;
    }

    public static void main(String[] args) {
//        Connection connection = getJDBCconnection("jdbc:mysql://localhost:3306/demo", "root", "12345678");
//        if (connection != null){
//            System.out.println("thành công");
//        }else {
//            System.out.println("thất bại");
//        }
        try {
            // connnect to database 'testdb'
            Connection conn = getJDBCconnection("jdbc:mysql://localhost:3306/furama", "root", "12345678");
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select * from khach_hang");
            // show data
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "  " + rs.getString(2)
                        + "  " + rs.getString(3));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
