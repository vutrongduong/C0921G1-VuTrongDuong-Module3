package service;

import bean.RentType;
import bean.Service;
import bean.ServiceType;

import java.util.List;
import java.util.Map;

public interface IService {
    Map<String, String> add(Service service);
    List<Service> display();
    List<RentType> displayRentType();
    List<ServiceType> displayType();
}
