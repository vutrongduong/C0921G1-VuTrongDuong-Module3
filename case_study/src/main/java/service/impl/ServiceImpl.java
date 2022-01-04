package service.impl;

import bean.RentType;
import bean.Service;
import bean.ServiceType;
import common.Validate;
import repository.IServiceRepository;
import repository.impl.ServiceRepository;
import service.IService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceImpl implements IService {
    IServiceRepository serviceRepository = new ServiceRepository();

    @Override
    public Map<String, String> add(Service service) {
        Map<String, String> msgMap = new HashMap<>();
        if (!Validate.checkName(service.getName())) {
            msgMap.put("name", "Invalid name format");
        }
        if (!Validate.checkNumberPositive(service.getArea())) {
            msgMap.put("area", "Invalid area format");
        }
        if (!Validate.checkNumberPositive((int) service.getCost())) {
            msgMap.put("cost", "Invalid cost format");
        }
        if (!Validate.checkNumber(service.getMaxPeople())) {
            msgMap.put("maxPeople", "Invalid max people format");
        }
        if ("".equals(service.getRentType().getRentTypeId())) {
            msgMap.put("rentType", "PLease input rent type");
        }
        if ("".equals(service.getType())) {
            msgMap.put("type", "PLease input type");
        }
        if ("".equals(service.getStandardRoom())) {
            msgMap.put("standardRoom", "Invalid input standard room");
        }
        if ("".equals(service.getDescriptionOtherConvenience())) {
            msgMap.put("description", "Invalid input description");
        }
        if (!Validate.checkNumberPositive((int) service.getPoolArea())) {
            msgMap.put("poolArea", "Invalid cost format");
        }
        if (!Validate.checkNumber(service.getNumberOfFloors())) {
            msgMap.put("numberOfFloors", "Invalid Number OfF loors format");
        }
        if (msgMap.isEmpty()) {
            serviceRepository.add(service);
        }
        return msgMap;
    }

    @Override
    public List<Service> display() {
        return serviceRepository.display();
    }

    @Override
    public List<RentType> displayRentType() {
        return serviceRepository.displayRentType();
    }

    @Override
    public List<ServiceType> displayType() {
        return serviceRepository.displayType();
    }

    public static void main(String[] args) {
       ServiceImpl service=new ServiceImpl();
       service.add(new Service("Villa Beach Front",25000,1000000,10,new RentType(3), new ServiceType(1),"vip","Có hồ bơi",500,4));
    }
}

