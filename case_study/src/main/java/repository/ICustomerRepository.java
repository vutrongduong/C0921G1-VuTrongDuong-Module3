package repository;

import bean.Customer;

import java.util.List;

public interface ICustomerRepository {
    void add(Customer customer);

    List<Customer> display();
}
