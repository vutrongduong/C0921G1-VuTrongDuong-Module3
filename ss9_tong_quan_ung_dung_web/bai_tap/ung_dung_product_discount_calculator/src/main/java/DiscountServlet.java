import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", urlPatterns = "/discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String list_price = request.getParameter("list_price");
        String discount_percent = request.getParameter("discount_percent");
        double discount_amount = Integer.parseInt(list_price) * Integer.parseInt(discount_percent) * 0.01;
        double discount_price = Integer.parseInt(list_price) - discount_amount;
        request.setAttribute("discount_amount", discount_amount);
        request.setAttribute("discount_price", discount_price);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
