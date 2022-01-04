package repository;

import bean.*;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    void add(Employee employee);

    List<Employee> display();

    List<Position> displayPosition();

    List<EducationDegree> displayEducationDegree();

    List<Division> displayDivision();
    List<User> displayUser();

    void delete(String id);

    void edit(Employee employee) throws SQLException;

    Employee searchId(int id);

    List<Employee> search(String nameSearch, String type, String phoneSearch);

    List<Employee> displayDB();
}
