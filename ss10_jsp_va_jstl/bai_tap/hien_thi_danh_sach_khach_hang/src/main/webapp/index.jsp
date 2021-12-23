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
        <c:forEach items="${list}" var="khach_hang">
            <tr>
                <td>${khach_hang.ten}</td>
                <td>${khach_hang.ngay_sinh}</td>
                <td>${khach_hang.dia_chi}</td>
                <td>
                    <img src="${khach_hang.anh}"></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
