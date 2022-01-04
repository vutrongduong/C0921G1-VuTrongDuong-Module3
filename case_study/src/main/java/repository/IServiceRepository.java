package repository;

import bean.CustomerType;
import bean.RentType;
import bean.Service;
import bean.ServiceType;

import java.util.List;

public interface IServiceRepository {
    void add(Service service);

    List<Service> display();
    List<RentType> displayRentType();
    List<ServiceType> displayType();
}
