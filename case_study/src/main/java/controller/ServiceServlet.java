package controller;

import bean.*;
import service.IService;
import service.impl.ServiceImpl;

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

@WebServlet(name = "ServiceServlet",urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    IService serviceImpl = new ServiceImpl();

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
//                case "edit":
//                    edit(request, response);
//                    break;
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
                    addServiceForm(request, response);
                    break;
//                case "delete":
//                    delete(request, response);
//                    break;
//                case "edit":
//                    editForm(request, response);
//                    break;
//                case "search":
//                    search(request, response);
                default:
                    listCustomer(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Service> serviceList = serviceImpl.display();
        List<ServiceType> serviceTypeList = serviceImpl.displayType();
        List<RentType> rentTypeList = serviceImpl.displayRentType();
        request.setAttribute("listService", serviceList);
        request.setAttribute("listServiceType", serviceTypeList);
        request.setAttribute("listRentType", rentTypeList);
        request.getRequestDispatcher("service/list.jsp").forward(request, response);
    }
    private void addServiceForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = null;
        for (Service service : serviceImpl.display()) {
            id = service.getId();
        }
        int idTemp = Integer.parseInt(id) + 1;
        if (idTemp < 10) {
            id = "DV-000" + idTemp;
        } else if (idTemp < 100) {
            id = "DV-00" + idTemp;
        } else if (idTemp < 1000) {
            id = "DV-0" + idTemp;
        }
        List<RentType> rentTypeList = serviceImpl.displayRentType();
        List<ServiceType> serviceTypeList = serviceImpl.displayType();
        request.setAttribute("id", id);
        request.setAttribute("listServiceType", serviceTypeList);
        request.setAttribute("listRentType", rentTypeList);
        request.getRequestDispatcher("/service/add.jsp").forward(request, response);
    }
    private void add(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int typeId = Integer.parseInt(request.getParameter("type"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        Service service = new Service(name,area,cost,maxPeople,new RentType(rentTypeId),new ServiceType(typeId),standardRoom,description,poolArea,numberOfFloors);
        Map<String, String> msgMap = serviceImpl.add(service);
        if (!msgMap.isEmpty()) {
            request.setAttribute("name", msgMap.get("name"));
            request.setAttribute("area", msgMap.get("area"));
            request.setAttribute("cost", msgMap.get("cost"));
            request.setAttribute("maxPeople", msgMap.get("maxPeople"));
            request.setAttribute("rentType", msgMap.get("rentType"));
            request.setAttribute("type", msgMap.get("type"));
            request.setAttribute("standardRoom", msgMap.get("standardRoom"));
            request.setAttribute("description", msgMap.get("description"));
            request.setAttribute("poolArea", msgMap.get("poolArea"));
            request.setAttribute("numberOfFloors", msgMap.get("numberOfFloors"));
            request.setAttribute("service", service);
            addServiceForm(request, response);
        }
        response.sendRedirect("/service");
    }
}
