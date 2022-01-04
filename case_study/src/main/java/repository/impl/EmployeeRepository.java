package repository.impl;

import bean.*;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = " SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` " +
            " left join education_degree on education_degree.education_degree_id=employee.education_degree_id " +
            " left join division on division.division_id=employee.division_id " +
            "  left join `user` on `user`.username=employee.username where flag = 1;";
    private static final String SELECT_ALL_EMPLOYEE_DB = " SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` \n" +
            "             left join education_degree on education_degree.education_degree_id=employee.education_degree_id  \n" +
            "             left join division on division.division_id=employee.division_id \n" +
            "             left join `user` on `user`.username=employee.username ";
    private static final String SELECT_ALL_POSITION = "SELECT * FROM position";
    private static final String SELECT_ALL_DIVISION = "SELECT * FROM division";
    private static final String SELECT_ALL_EDUCATIONDEGREE = "SELECT * FROM education_degree";
    private static final String SELECT_ALL_USER = "SELECT * FROM user";
    private static final String DELETE_EMPLOYEE = " update employee set flag=0 where employee_id=?; ";
    private static final String ADD_EMPLOYEE = " insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id)\n" +
            "values\n" +
            " (?,?,?,?,?,?,?,?,?,?); ";
    private static final String EDIT_EMPLOYEE = " update employee set employee_name=?,employee_birthday=?,employee_id_card=?,employee_salary=?,employee_phone=?,employee_email=?,employee_address=?,position_id=?,education_degree_id=?,division_id=?\n" +
            "where employee_id=?; ";
    private static final String GET_EMPLOYEE = "SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` " +
            "          left join education_degree on education_degree.education_degree_id=employee.education_degree_id " +
            "            left join division on division.division_id=employee.division_id" +
            "             left join `user` on `user`.username=employee.username where flag = 1 and employee_id=? ";
    private static final String SEARCH_EMPLOYEE = " SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` \n" +
            "             left join education_degree on education_degree.education_degree_id=employee.education_degree_id  \n" +
            "             left join division on division.division_id=employee.division_id \n" +
            "             left join `user` on `user`.username=employee.username\n" +
            "             where flag = 1 and (employee_name like ? or employee_id =?)\n" +
            "union \n" +
            "SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` \n" +
            "             left join education_degree on education_degree.education_degree_id=employee.education_degree_id  \n" +
            "             left join division on division.division_id=employee.division_id \n" +
            "             left join `user` on `user`.username=employee.username\n" +
            "             where flag = 1 and (employee.position_id = ? )\n" +
            "union\n" +
            "SELECT * FROM employee left join `position` on `position`.postion_id=employee.`position_id` \n" +
            "             left join education_degree on education_degree.education_degree_id=employee.education_degree_id  \n" +
            "             left join division on division.division_id=employee.division_id \n" +
            "             left join `user` on `user`.username=employee.username\n" +
            "             where flag = 1 and (employee_phone like ? );";

    @Override
    public void add(Employee employee) {
        try (PreparedStatement ps = DBConnection.connection.prepareStatement(ADD_EMPLOYEE)) {
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPosition().getPositionId());
            ps.setInt(9, employee.getEducationDegree().getEducationDegreeId());
            ps.setInt(10, employee.getDivision().getDivisionId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Employee> display() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_EMPLOYEE);
            while (rs.next()) {
                String id = rs.getString("employee_id");
                String name = rs.getString("employee_name");
                String birthday = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                Position position = new Position(rs.getInt("postion_id"), rs.getString("position_name"));
                EducationDegree educationDegree = new EducationDegree(rs.getInt("education_degree_id"), rs.getString("education_degree_name"));
                Division division = new Division(rs.getInt("division_id"), rs.getString("division_name"));
                User username = new User(rs.getString("username"), rs.getString("password"));
                employeeList.add(new Employee(id, name, birthday, idCard, salary, phone, email, address, position, educationDegree, division, username));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Position> displayPosition() {
        List<Position> positions = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_POSITION);
            while (rs.next()) {
                int id = rs.getInt("postion_id");
                String name = rs.getString("position_name");
                positions.add(new Position(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positions;
    }

    @Override
    public List<EducationDegree> displayEducationDegree() {
        List<EducationDegree> educationDegrees = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_EDUCATIONDEGREE);
            while (rs.next()) {
                int id = rs.getInt("education_degree_id");
                String name = rs.getString("education_degree_name");
                educationDegrees.add(new EducationDegree(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegrees;
    }

    @Override
    public List<Division> displayDivision() {
        List<Division> divisions = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_DIVISION);
            while (rs.next()) {
                int id = rs.getInt("division_id");
                String name = rs.getString("division_name");
                divisions.add(new Division(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisions;
    }

    @Override
    public List<User> displayUser() {
        List<User> users = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_USER);
            while (rs.next()) {
                String user = rs.getString("username");
                String pass = rs.getString("password");
                users.add(new User(user, pass));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    @Override
    public void delete(String id) {
        try {
            PreparedStatement stmt = DBConnection.connection.prepareStatement(DELETE_EMPLOYEE);
            stmt.setString(1, id);
            stmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(Employee employee) throws SQLException {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(EDIT_EMPLOYEE);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPosition().getPositionId());
            ps.setInt(9, employee.getEducationDegree().getEducationDegreeId());
            ps.setInt(10, employee.getDivision().getDivisionId());
            ps.setString(11, employee.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee searchId(int id) {
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(GET_EMPLOYEE);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(
                        rs.getString("employee_id"),
                        rs.getString("employee_name"),
                        rs.getString("employee_birthday"),
                        rs.getString("employee_id_card"),
                        rs.getDouble("employee_salary"),
                        rs.getString("employee_phone"),
                        rs.getString("employee_email"),
                        rs.getString("employee_address"),
                        new Position(rs.getInt("postion_id"), rs.getString("position_name")),
                        new EducationDegree(rs.getInt("education_degree_id"), rs.getString("education_degree_name")),
                        new Division(rs.getInt("division_id"), rs.getString("division_name")),
                        new User(rs.getString("username"), rs.getString("password")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Employee> search(String nameSearch, String positionSearch, String phoneSearch) {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement ps = DBConnection.connection.prepareStatement(SEARCH_EMPLOYEE);
            if (("".equals(nameSearch)) && (positionSearch == null) && ("".equals(phoneSearch))) {
                return display();
            }
            if ("".equals(nameSearch)) {
                ps.setString(1, null);
                ps.setString(2, null);
            } else {
                ps.setString(1, "%" + nameSearch + "%");
                ps.setString(2, nameSearch);
            }
            if ("".equals(positionSearch)) {
                ps.setString(3, null);
            } else {
                ps.setString(3, positionSearch);
            }

            if ("".equals(phoneSearch)) {
                ps.setString(4, null);
            } else {
                ps.setString(4, "%" + phoneSearch + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString("employee_id");
                String name = rs.getString("employee_name");
                String birthday = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                Position position = new Position(rs.getInt("postion_id"), rs.getString("position_name"));
                EducationDegree educationDegree = new EducationDegree(rs.getInt("education_degree_id"), rs.getString("education_degree_name"));
                Division division = new Division(rs.getInt("division_id"), rs.getString("division_name"));
                User username = new User(rs.getString("username"), rs.getString("password"));
                employeeList.add(new Employee(id, name, birthday, idCard, salary, phone, email, address, position, educationDegree, division, username));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> displayDB() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            Statement stmt = DBConnection.connection.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_EMPLOYEE_DB);
            while (rs.next()) {
                String id = rs.getString("employee_id");
                String name = rs.getString("employee_name");
                String birthday = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                Position position = new Position(rs.getInt("postion_id"), rs.getString("position_name"));
                EducationDegree educationDegree = new EducationDegree(rs.getInt("education_degree_id"), rs.getString("education_degree_name"));
                Division division = new Division(rs.getInt("division_id"), rs.getString("division_name"));
                User username = new User(rs.getString("username"), rs.getString("password"));
                employeeList.add(new Employee(id, name, birthday, idCard, salary, phone, email, address, position, educationDegree, division, username));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return employeeList;
    }

    public static void main(String[] args) {
        EmployeeRepository employeeRepository = new EmployeeRepository();
//        for (Employee e :
//                employeeRepository.display()) {
//            System.out.println(e);
//
//        }
//        employeeRepository.add(new Employee("Nguyễn Văn An","1970-11-07","456231786","100","0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",new Position(1),new EducationDegree(3),new Division(3)));
        System.out.println(employeeRepository.search("","1",""));
    }
}
