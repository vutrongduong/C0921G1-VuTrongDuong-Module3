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
        List<Customer> customerList = customerRepository.display();
        for (Customer customer : customerList) {
            if (customer.getCustomerGender().equals("1")) {
                customer.setCustomerGender("Nam");
            } else {
                customer.setCustomerGender("Nữ");
            }
        }
        return customerList;
    }
}
