<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID: </td>
                <td><input type="text" name="id"  value="${product.id}" readonly></td>
            </tr>
            <tr>
                <td>Code: </td>
                <td><input type="text" name="code"  value="${product.code}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name"  value="${product.name}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price"  value="${product.price}"></td>
            </tr>
            <tr>
                <td>Amount: </td>
                <td><input type="text" name="amount"  value="${product.amount}"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="description"  value="${product.description}"></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td><input type="text" name="status"  value="${product.status}"></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
