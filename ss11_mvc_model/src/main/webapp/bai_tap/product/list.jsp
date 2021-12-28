<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/product?action=add">Create new product</a>
</p>
<table border="1">
    <tr>
        <form method="post" action="/product?action=search">
<%--            <input type="hidden" name="action" value="search">--%>
            <input type="text" name="name" placeholder="search by name">
            <input type="submit" value="Search">
        </form>
    </tr>
    <tr>
        <td>ID</td>
        <td>Code</td>
        <td>Name</td>
        <td>Price</td>
        <td>Amount</td>
        <td>Description</td>
        <td>Status</td>
    </tr>
    <c:forEach items='${products}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.id}">${product.id}</a></td>
            <td>${product.code}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.amount}</td>
            <td>${product.description}</td>
            <td>${product.status}</td>
            <td><a href="/product?action=update&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>