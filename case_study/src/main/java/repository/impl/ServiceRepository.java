package repository.impl;

import bean.*;
import repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    private static final String ADD_SERVICE = " insert into service (service_name, service_area, service_cost, service_max_people , rent_type_id , service_type_id ,  standard_room , description_other_convenience , pool_area , number_of_floors) " +
            " values " +
            "(?,?,?,?,?,?,?,?,?,?); ";
    private static final String SELECT_ALL_SERVICE_DB = " SELECT * FROM service left join service_type on service.service_type_id=service_type.service_type_id\n" +
            " left join rent_type on rent_type.rent_type_id= service.rent_type_id; ";
    private static final String SELECT_ALL_SERVICE_TYPE = "SELECT * FROM service_type";
    private static final String SELECT_ALL_RENT_TYPE = "SELECT * FROM rent_type";

    @Override
    public void add(Service service) {
        try (PreparedStatement ps = DBConnection.connection.prepareStatement(ADD_SERVICE)) {
            ps.setString(1, service.getName());
            ps.setInt(2, service.getArea());
            ps.setDouble(3, service.getCost());
            ps.setInt(4, service.getMaxPeople());
            ps.setInt(5, service.getRentType().getRentTypeId());
            ps.setInt(6, service.getType().getServiceTypeId());
            ps.setString(7, service.getStandardRoom());
            ps.setString(8, service.getDescriptionOtherConvenience());
            ps.setDouble(9, service.getPoolArea());
            ps.setInt(10, service.getNumberOfFloors());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Service> display() {
        List<Service> serviceList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_SERVICE_DB);
            while (rs.next()) {
                String id = rs.getString("service_id");
                String name = rs.getString("service_name");
                int area = rs.getInt("service_area");
                double cost = rs.getDouble("service_cost");
                int maxPeople = rs.getInt("service_max_people");
                RentType rentType=new RentType(rs.getInt("rent_type_id"),rs.getString("rent_type_name"),rs.getDouble("rentcost"));
                ServiceType serviceType=new ServiceType(rs.getInt("service_type_id"),rs.getString("service_type_name"));
                String standardRoom = rs.getString("standard_room");
                String description= rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");
                serviceList.add(new Service(id, name, area, cost, maxPeople,
                        rentType, serviceType, standardRoom, description,poolArea,numberOfFloors));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public List<RentType> displayRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_RENT_TYPE);
            while (rs.next()) {
                int id = rs.getInt("rent_type_id");
                String name = rs.getString("rent_type_name");
                double cost = rs.getDouble("rentcost");
                rentTypeList.add(new RentType(id, name,cost));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public List<ServiceType> displayType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_SERVICE_TYPE);
            while (rs.next()) {
                int id = rs.getInt("service_type_id");
                String name = rs.getString("service_type_name");
                serviceTypeList.add(new ServiceType(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceTypeList;
    }

    public static void main(String[] args) {
        ServiceRepository serviceRepository=new ServiceRepository();
        for (Service s:serviceRepository.display()
             ) {
            System.out.println(s);

        }
//        serviceRepository.add(new Service("Villa Beach Front",25000,1000000,10,new RentType(3), new ServiceType(1),"vip","Có hồ bơi",500,4));
    }
}
