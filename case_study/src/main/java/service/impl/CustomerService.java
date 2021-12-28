package service.impl;

import bean.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;


public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public void add(Customer customer) {
        customerRepository.add(customer);
    }

    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
