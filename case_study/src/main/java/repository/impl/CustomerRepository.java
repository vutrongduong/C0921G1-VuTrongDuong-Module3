package repository.impl;

import bean.Customer;
import bean.CustomerType;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customer left join customer_type on customer.customer_type_id=customer_type.customer_type_id where flag=1;";
    private static final String SELECT_ALL_CUSTOMER_DB = "SELECT * FROM customer left join customer_type on customer.customer_type_id=customer_type.customer_type_id ";
    private static final String SELECT_ALL_CUSTOMER_TYPE = "SELECT * FROM customer_type";
    private static final String DELETE_CUSTOMER = "update customer set flag=0 where customer_id=?;  ";
    private static final String ADD_CUSTOMER = "insert into customer (customer_type_id ,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,flag)\n" +
            " values (?,?,?,?,?,?,?,?,1);";
    private static final String EDIT_CUSTOMER = "update customer set customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=?\n" +
            " where customer_id=?;";
    private static final String GET_CUSTOMER = "SELECT * FROM customer left join customer_type on customer.customer_type_id=customer_type.customer_type_id where customer_id= ? ";
    private static final String SEARCH_CUSTOMER = " SELECT * FROM customer  join customer_type on customer.customer_type_id=customer_type.customer_type_id where flag=1 and (customer_name like ? or customer_id = ? ) " +
            " union " +
            " SELECT * FROM customer  join customer_type on customer.customer_type_id=customer_type.customer_type_id where flag=1 and (customer.customer_type_id = ? ) " +
            " union " +
            " SELECT * FROM customer  join customer_type on customer.customer_type_id=customer_type.customer_type_id where flag=1 and (customer_phone like ? )";

    public List<Customer> display() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_CUSTOMER);
            while (rs.next()) {
                String id = rs.getString("customer_id");
                CustomerType customerType = new CustomerType(rs.getString("customer_type_id"), rs.getString("customer_type_name"));
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customerList.add(new Customer(id, customerType, name, birthDay, gender,
                        idCard, phone, email, address));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customerList;
    }
    public List<Customer> displayDB() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_CUSTOMER_DB);
            while (rs.next()) {
                String id = rs.getString("customer_id");
                CustomerType customerType = new CustomerType(rs.getString("customer_type_id"), rs.getString("customer_type_name"));
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customerList.add(new Customer(id, customerType, name, birthDay, gender,
                        idCard, phone, email, address));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customerList;
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

    public List<CustomerType> displayType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_CUSTOMER_TYPE);
            while (rs.next()) {
                String id = rs.getString("customer_type_id");
                String name = rs.getString("customer_type_name");
                customerTypeList.add(new CustomerType(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public void add(Customer customer) {
        try (PreparedStatement ps = DBConnection.connection.prepareStatement(ADD_CUSTOMER)) {
            ps.setString(1, customer.getType().getTypeId());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getBirthday());
            ps.setInt(4, Integer.parseInt(customer.getGender()));
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void edit(Customer customer) throws SQLException {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(EDIT_CUSTOMER);
            ps.setString(1, customer.getType().getTypeId());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getBirthday());
            ps.setInt(4, Integer.parseInt(customer.getGender()));
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.setString(9, customer.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Customer searchId(int id) {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(GET_CUSTOMER);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getString("customer_id"),
                        new CustomerType(rs.getString("customer_type_id"), rs.getString("customer_type_name")),
                        rs.getString("customer_name"),
                        rs.getString("customer_birthday"),
                        rs.getString("customer_gender"),
                        rs.getString("customer_id_card"),
                        rs.getString("customer_phone"),
                        rs.getString("customer_email"),
                        rs.getString("customer_address"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Customer> search(String nameSearch, String type, String phoneSearch) {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(SEARCH_CUSTOMER);
            if (("".equals(nameSearch)) && (type == null) && ("".equals(phoneSearch))) {
                return display();
            }
            if ("".equals(nameSearch)) {
                ps.setString(1, null);
                ps.setString(2, null);
            } else {
                ps.setString(1, "%" + nameSearch + "%");
                ps.setString(2, nameSearch);
            }
            if ("".equals(type)) {
                ps.setString(3, null);
            } else {
                ps.setString(3, type);
            }

            if ("".equals(phoneSearch)) {
                ps.setString(4, null);
            } else {
                ps.setString(4, "%" + phoneSearch + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString("customer_id");
                CustomerType customerType = new CustomerType(rs.getString("customer_type_id"), rs.getString("customer_type_name"));
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customerList.add(new Customer(id, customerType, name, birthDay, gender,
                        idCard, phone, email, address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
