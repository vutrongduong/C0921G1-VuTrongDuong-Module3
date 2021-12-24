import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "KhachHangServlet",urlPatterns = "/khachHang")
public class KhachHangServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        KhachHangImpl khachHang = new KhachHangImpl();
        List<KhachHang> khachHangList = khachHang.list();
        request.setAttribute("list", khachHangList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
