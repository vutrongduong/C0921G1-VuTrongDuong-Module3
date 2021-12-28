package service;

import bean.Customer;

import java.util.List;

public interface ICustomerService{
    void add(Customer customer);
    List<Customer> display();
}
