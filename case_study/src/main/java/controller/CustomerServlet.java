package controller;

import bean.Customer;
import bean.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;
import service.impl.CustomerService;

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

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    ICustomerService customerService = new CustomerService();

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
                    addCustomerForm(request, response);
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
                    listCustomer(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Customer> customerList = customerService.display();
        List<CustomerType> customerTypeList = customerService.displayType();
        request.setAttribute("listCustomer", customerList);
        request.setAttribute("listCustomerType", customerTypeList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }

    private void addCustomerForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = null;
        for (Customer customer : customerService.displayDB()) {
            id = customer.getId();
        }
        int idTemp = Integer.parseInt(id) + 1;
        if (idTemp < 10) {
            id = "KH-000" + idTemp;
        } else if (idTemp < 100) {
            id = "KH-00" + idTemp;
        } else if (idTemp < 1000) {
            id = "KH-0" + idTemp;
        }
        List<CustomerType> customerTypeList = customerService.displayType();
        request.setAttribute("id", id);
        request.setAttribute("listCustomerType", customerTypeList);
        request.getRequestDispatcher("/customer/add.jsp").forward(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {
        String customerTypeId = request.getParameter("customerType");
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(new CustomerType(customerTypeId), name, birthDay, gender, idCard, phone, email, address);
        Map<String, String> msgMap = customerService.add(customer);
        if (!msgMap.isEmpty()) {
            request.setAttribute("type", msgMap.get("type"));
            request.setAttribute("name", msgMap.get("name"));
            request.setAttribute("date", msgMap.get("date"));
            request.setAttribute("gender", msgMap.get("gender"));
            request.setAttribute("idCard", msgMap.get("idCard"));
            request.setAttribute("email", msgMap.get("email"));
            request.setAttribute("address", msgMap.get("address"));
            request.setAttribute("customer", customer);
            addCustomerForm(request, response);
        }
        response.sendRedirect("/customer");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String customerTypeId = request.getParameter("customerId");
        customerService.delete(customerTypeId);
        response.sendRedirect("customer");
    }

    private void editForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("customerId");
        request.setAttribute("id", id);
        Customer customer = customerService.searchId((id));
        List<CustomerType> customerTypeList = customerService.displayType();
        request.setAttribute("listCustomerType", customerTypeList);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/customer/edit.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        String customerTypeId = request.getParameter("customerType");
        CustomerType customerType = new CustomerType();
        customerType.setTypeId(customerTypeId);
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, customerType, name, birthDay, gender, idCard, phone, email, address);
        customerService.edit(customer);
        response.sendRedirect("/customer");
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<CustomerType> customerTypeList = customerService.displayType();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String phone = request.getParameter("phone");
        List<Customer> customerList = customerService.search(name, type, phone);
        request.setAttribute("listCustomerType", customerTypeList);
        request.setAttribute("listCustomer", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }
}
