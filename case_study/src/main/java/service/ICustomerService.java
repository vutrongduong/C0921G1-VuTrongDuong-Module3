package service;

import bean.Customer;
import bean.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService{
    Map<String, String> add(Customer customer);
    List<Customer> display();
    List<CustomerType> displayType();
    void delete(String id);
    void edit(Customer customer) throws SQLException;
    Customer searchId(String id);
    List<Customer> search(String nameSearch, String type, String phoneSearch);
    List<Customer> displayDB();
}
