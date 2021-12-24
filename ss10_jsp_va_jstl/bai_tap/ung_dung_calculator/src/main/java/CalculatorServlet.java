import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet",urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("firstOperand"));
        float secondOperand = Integer.parseInt(request.getParameter("secondOperand"));
        char operator = request.getParameter("operator").charAt(0);

        try {
            float result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("firstOperand",firstOperand);
            request.setAttribute("operator",operator);
            request.setAttribute("secondOperand",secondOperand);
            request.setAttribute("result",Float.toString(result));
            request.getRequestDispatcher("display.jsp").forward(request,response);
        } catch (Exception ex) {
            request.setAttribute("result",("Error: " + ex.getMessage()));
            request.getRequestDispatcher("display.jsp").forward(request,response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}