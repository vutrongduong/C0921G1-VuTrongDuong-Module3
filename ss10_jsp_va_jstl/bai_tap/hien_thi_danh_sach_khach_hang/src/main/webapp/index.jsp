<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
    <meta charset="UTF-8">
</head>
<body>
<form action="/khach_hang">
    <table border="1"  style="border-spacing: 30px;border-collapse: collapse">

        <tr style="font-size: 30px;"> <th colspan="4">Danh sách khách hàng</th></tr>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach items="${list}" var="khachHang">
            <tr>
                <td>${khachHang.ten}</td>
                <td>${khachHang.ngay_sinh}</td>
                <td>${khachHang.dia_chi}</td>
                <td>
                    <img src="${khachHang.anh}"></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
