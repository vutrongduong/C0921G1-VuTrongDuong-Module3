<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
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

            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>