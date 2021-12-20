package controller;

import Impl.LoginImpl;
import Impl.ProductImpl;
import model.Account;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServletProduct", urlPatterns = "/product")
public class ServletProduct extends HttpServlet {
    ProductImpl product = new ProductImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    addProduct(request,response);
                    break;
                case "edit":
                    editProduct(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    showEdit(request,response);
                case "add":
                    showProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    ListProduct(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void ListProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Product> ListProduct = product.pindAllProduct();
        request.setAttribute("ListProduct", ListProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String id = request.getParameter("id");
        product.deleteProduct(id);
        response.sendRedirect("product");
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Product newProduct = new Product(code, name, price, amount, description, status);
        product.addProduct(newProduct);
        response.sendRedirect("product");
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add.jsp");
        dispatcher.forward(request, response);
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id= Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Product editProduct = new Product(id,code, name, price, amount,description,status);
        product.editProduct(editProduct);
        response.sendRedirect("product");
    }
    private void showEdit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product productNew = product.getProductID(id);
        request.setAttribute("product", productNew);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        dispatcher.forward(request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response){
        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            LoginImpl login = new LoginImpl();
            Account account = login.login(user, pass);
            if (account == null) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("list.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
