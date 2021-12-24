<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>ID</td>
        <td>Code</td>
        <td>Name</td>
        <td>Price</td>
        <td>Amount</td>
        <td>Description</td>
        <td>Status</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.id}"></a></td>
            <td>${product.code}</td>
            <td><a href="/product?action=view&id=${product.name}"></a></td>
            <td>${product.price}</td>
            <td>${product.amount}</td>
            <td>${product.description}</td>
            <td>${product.status}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>