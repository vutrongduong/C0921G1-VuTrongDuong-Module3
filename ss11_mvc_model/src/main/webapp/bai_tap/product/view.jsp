<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>ID:</td>
        <td><input type="text" name="id" value="${product.id}"></td>
    </tr>
    <tr>
        <td>Code:</td>
        <td><input type="text" name="code" value="${product.code}"></td>
    </tr>
    <tr>
        <td>Name:</td>
        <td><input type="text" name="name" value="${product.name}"></td>
    </tr>
    <tr>
        <td>Price:</td>
        <td><input type="text" name="price" value="${product.price}"></td>
    </tr>
    <tr>
        <td>Amount:</td>
        <td><input type="text" name="amount" value="${product.amount}"></td>
    </tr>
    <tr>
        <td>Description:</td>
        <td><input type="text" name="description" value="${product.description}"></td>
    </tr>
    <tr>
        <td>Status:</td>
        <td><input type="text" name="status" value="${product.status}"></td>
    </tr>
</table>
</body>
</html>