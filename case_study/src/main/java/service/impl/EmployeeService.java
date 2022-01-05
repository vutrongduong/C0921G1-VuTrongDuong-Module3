package service.impl;

import bean.*;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public void add(Employee employee) {
        employeeRepository.add(employee);
    }

    @Override
    public List<Employee> display() {
        return employeeRepository.display();
    }

    @Override
    public List<Position> displayPosition() {
        return employeeRepository.displayPosition();
    }

    @Override
    public List<EducationDegree> displayEducationDegree() {
        return employeeRepository.displayEducationDegree();
    }

    @Override
    public List<Division> displayDivision() {
        return employeeRepository.displayDivision();
    }

    @Override
    public List<User> displayUser() {
        return null;
    }

    @Override
    public void delete(String id) {
        employeeRepository.delete(id);
    }

    @Override
    public void edit(Employee employee) throws SQLException {
        employeeRepository.edit(employee);
    }

    @Override
    public Employee searchId(int id) {
        return employeeRepository.searchId(id);
    }

    @Override
    public List<Employee> search(String nameSearch, String positionSearch, String phoneSearch) {
        return employeeRepository.search(nameSearch,positionSearch,phoneSearch);
    }

    @Override
    public List<Employee> displayDB() {
        return employeeRepository.displayDB();
    }
}
