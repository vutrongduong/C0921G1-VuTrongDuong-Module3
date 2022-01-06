package controller;

import bean.BenhAn;
import bean.BenhNhan;
import service.IBenhAnService;
import service.impl.BenhAnService;

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

@WebServlet(name = "BenhAnServlet", urlPatterns = {"/benhAn", ""})
public class BenhAnServlet extends HttpServlet {
    IBenhAnService benhAnService = new BenhAnService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    edit(request, response);
                    break;
            }
        } catch (SQLException throwables) {
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
//                case "add":
//                    addBenhAnForm(request, response);
//                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "edit":
                    editForm(request, response);
                    break;
//                case "search":
//                    search(request, response);
//                    break;
                default:
                    listBenhAn(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void listBenhAn(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<BenhAn> benhAnList = benhAnService.display();
        List<BenhNhan> benhNhanList = benhAnService.displayBenhNhan();
        request.setAttribute("benhAnList", benhAnList);
        request.setAttribute("benhNhanList", benhNhanList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    private void editForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("benhAnId");
        request.setAttribute("idBenhAn", id);
        BenhAn benhAn = benhAnService.searchId((id));
        request.setAttribute("idBenhNhan", benhAn.getBenhNhan().getId());
        if (Integer.parseInt(benhAn.getBenhNhan().getId()) < 10) {
            benhAn.setId("BN-00" + benhAn.getId());
        } else if (Integer.parseInt(benhAn.getBenhNhan().getId()) < 100) {
            benhAn.getBenhNhan().setId("BN-0" + benhAn.getBenhNhan().getId());
        } else {
            benhAn.getBenhNhan().setId("BN-" + benhAn.getBenhNhan().getId());
        }
        request.setAttribute("benhAn", benhAn);
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("idBenhAn");
        String idTemp = request.getParameter("idTemp");
        BenhNhan benhNhan = new BenhNhan(request.getParameter("idBenhNhan"), request.getParameter("ten"));
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayRaVien = request.getParameter("ngayRaVien");
        String lyDo = request.getParameter("lyDo");
        BenhAn benhAn = new BenhAn(id, benhNhan, ngayNhapVien, ngayRaVien, lyDo);
        Map<String, String> map = benhAnService.edit(benhAn);
        if (!map.isEmpty()) {
            request.setAttribute("lyDo", map.get("benhAn"));
            request.setAttribute("ten", map.get("ten"));
            request.setAttribute("ngay", map.get("ngay"));
            request.setAttribute("idBenhAn", idTemp);
            request.setAttribute("benhAn", benhAn);
            request.getRequestDispatcher("/edit.jsp").forward(request, response);
        }
        request.setAttribute("lyDo", map.get("benhAn"));
        request.setAttribute("ten", map.get("ten"));
        request.setAttribute("ngay", map.get("ngay"));
        request.setAttribute("idBenhAn", idTemp);
        request.setAttribute("benhAn", benhAn);
        request.setAttribute("thongBao","Đã sửa thông tin bệnh án thành công !!!");
        request.setAttribute("troVe","Ấn trở về để quay trở lại màn hình chính");
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("benhAnId");
        benhAnService.delete(id);
        response.sendRedirect("benhAn");
    }
}
