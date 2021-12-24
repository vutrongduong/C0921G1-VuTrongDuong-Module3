package bai_tap.tao_ung_dung_quan_ly_san_pham.controller;

import bai_tap.tao_ung_dung_quan_ly_san_pham.model.Product;
import bai_tap.tao_ung_dung_quan_ly_san_pham.service.ProductService;
import bai_tap.tao_ung_dung_quan_ly_san_pham.service.ProductServiceImpl;
import thuc_hanh.ung_dung_quan_ly_khach_hang.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet" , urlPatterns = {"/product","/"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
//            case "create":
//                break;
//            case "edit":
//                break;
//            case "delete":
//                break;
//            case "view":
//                break;
            default:
            listCustomers(request,response);
                break;
        }
    }
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.display();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bai_tap/product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
