package repository;

import bean.Customer;
import bean.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    void add(Customer customer);

    List<Customer> display();

    List<CustomerType> displayType();

    void delete(String id);
    void edit(Customer customer) throws SQLException;
    Customer searchId(int id);
    List<Customer> search(String nameSearch, String type, String phoneSearch);
    List<Customer> displayDB();
}
