package controller;

import bean.*;
import service.ICustomerService;
import service.IEmployeeService;
import service.impl.CustomerService;
import service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    add(request, response);
                    break;
                case "edit":
                    edit(request, response);
                    break;
            }
        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    addEmployeeForm(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "edit":
                    editForm(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
                default:
                    listEmployee(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Employee> employeeList = employeeService.display();
        List<Position> positions = employeeService.displayPosition();
        List<EducationDegree> educationDegrees = employeeService.displayEducationDegree();
        List<Division> divisions = employeeService.displayDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positions", positions);
        request.setAttribute("educationDegrees", educationDegrees);
        request.setAttribute("divisions", divisions);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    private void addEmployeeForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = 0;
        for (Employee employee : employeeService.displayDB()) {
            id = Integer.parseInt(employee.getId());
        }
        id = id + 1;
        List<Position> positions = employeeService.displayPosition();
        List<EducationDegree> educationDegrees = employeeService.displayEducationDegree();
        List<Division> divisions = employeeService.displayDivision();
        request.setAttribute("id", id);
        request.setAttribute("positions", positions);
        request.setAttribute("educationDegrees", educationDegrees);
        request.setAttribute("divisions", divisions);
        request.getRequestDispatcher("/employee/add.jsp").forward(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));
        employeeService.add(new Employee(name, birthDay, idCard, salary, phone, email, address, new Position(position), new EducationDegree(educationDegree), new Division(division)));

//        if (!msgMap.isEmpty()) {
//            request.setAttribute("name", msgMap.get("name"));
//            request.setAttribute("area", msgMap.get("area"));
//            request.setAttribute("cost", msgMap.get("cost"));
//            request.setAttribute("maxPeople", msgMap.get("maxPeople"));
//            request.setAttribute("rentType", msgMap.get("rentType"));
//            request.setAttribute("type", msgMap.get("type"));
//            request.setAttribute("standardRoom", msgMap.get("standardRoom"));
//            request.setAttribute("description", msgMap.get("description"));
//            request.setAttribute("poolArea", msgMap.get("poolArea"));
//            request.setAttribute("numberOfFloors", msgMap.get("numberOfFloors"));
//            request.setAttribute("service", service);
//            addServiceForm(request, response);
//        }
        response.sendRedirect("/employee");
    }
    private void editForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        Employee employee = employeeService.searchId(id);
        List<Position> positions = employeeService.displayPosition();
        List<EducationDegree> educationDegrees = employeeService.displayEducationDegree();
        List<Division> divisions = employeeService.displayDivision();
        request.setAttribute("positions", positions);
        request.setAttribute("educationDegrees", educationDegrees);
        request.setAttribute("divisions", divisions);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/employee/edit.jsp").forward(request, response);
    }
    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));
        employeeService.edit(new Employee(id,name, birthDay, idCard, salary, phone, email, address, new Position(position), new EducationDegree(educationDegree), new Division(division)));
        response.sendRedirect("/employee");
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("employeeId");
        employeeService.delete(id);
        response.sendRedirect("/employee");
    }
    private void search(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Position> positions = employeeService.displayPosition();
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        List<Employee> employeeList = employeeService.search(name, position, phone);
        request.setAttribute("positions", positions);
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }
}
