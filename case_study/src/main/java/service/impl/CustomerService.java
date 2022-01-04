package service.impl;

import bean.Customer;
import bean.CustomerType;
import common.Validate;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public Map<String, String> add(Customer customer) {
        Map<String, String> msgMap = new HashMap<>();
        if (null == (customer.getType().getTypeId())) {
            msgMap.put("type", "Please select customer type");
        }
        if ("".equals(customer.getName())) {
            msgMap.put("name", "PLease input name");
        }
        if (!Validate.checkDate(customer.getBirthday())) {
            msgMap.put("date", "Invalid date format");
        }
        if (null == (customer.getGender())) {
            msgMap.put("gender", "Please select your gender");
        }
        if (!Validate.checkIdCard(customer.getIdCard())) {
            msgMap.put("idCard", "Invalid id card format");
        }
        if (!Validate.checkIdEmail(customer.getEmail())) {
            msgMap.put("email", "Invalid email format");
        }
        if ("".equals(customer.getAddress())) {
            msgMap.put("address", "PLease input address");
        }
        if (msgMap.isEmpty()) {
            customerRepository.add(customer);
        }
        return msgMap;
    }

    @Override
    public List<Customer> display() {
        List<Customer> customerList = customerRepository.display();
        for (Customer customer : customerList) {
            if (customer.getGender().equals("1")) {
                customer.setGender("Male");
            } else {
                customer.setGender("Female");
            }
            if (Integer.parseInt(customer.getId()) < 10) {
                customer.setId("KH-000" + customer.getId());
            } else if (Integer.parseInt(customer.getId()) < 100) {
                customer.setId("KH-00" + customer.getId());
            } else if (Integer.parseInt(customer.getId()) < 1000) {
                customer.setId("KH-0" + customer.getId());
            }
        }
        return customerList;
    }

    @Override
    public List<CustomerType> displayType() {
        return customerRepository.displayType();
    }

    @Override
    public void delete(String id) {
        String arr[]=id.split("");
        String idTemp ="";
        for (int i = 3; i <arr.length ; i++) {
            if (!arr[i].equals("0")){
            idTemp=id.substring(i,arr.length);
             break;
            }
        }
        customerRepository.delete(idTemp);
    }

    @Override
    public void edit(Customer customer) throws SQLException {
        customerRepository.edit(customer);
    }

    @Override
    public Customer searchId(String id) {
        String arr[]=id.split("");
        String idTemp ="";
        for (int i = 3; i <arr.length ; i++) {
            if (!arr[i].equals("0")){
                idTemp+=arr[i];
            }
        }
        return customerRepository.searchId(Integer.parseInt(idTemp));
    }

    @Override
    public List<Customer> search(String nameSearch, String type, String phoneSearch) {
        List<Customer> customerList = customerRepository.search(nameSearch, type, phoneSearch);
        for (Customer customer : customerList) {
            if (customer.getGender().equals("1")) {
                customer.setGender("Male");
            } else {
                customer.setGender("Female");
            }
        }
        return customerList;
    }

    @Override
    public List<Customer> displayDB() {
        return customerRepository.displayDB();
    }

    public static void main(String[] args) {
        CustomerService customerService=new CustomerService();
//        Customer customer=new Customer("100",null,"null","4",null,"","","","");
//        Map<String, String> map=customerService.add(customer);
//        for (String s:map.values()
//             ) {
//            System.out.println(s);
//
//        }
////        System.out.println(customerService.searchId());
//        String id ="";
//        String arr[]="KH-0001".split("");
//        for (int i = 3; i <arr.length ; i++) {
//           if (!arr[i].equals("0")){
//               id+=arr[i];
//           }
//        }
//        System.out.println(id);
//        System.out.println(customerService.searchId("KH-0001"));
//        for (Customer c: customerService.display()) {
//            System.out.println(c);
//        }
        customerService.delete("KH-0010");
    }
}
