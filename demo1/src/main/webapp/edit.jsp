<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/17/2021
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/product?action=product">List All Product</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="7">
            <caption>
                <h2>
                    Edit Product
                </h2>
            </caption>
            <c:if test="${product != null}">
                <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
            </c:if>
            <tr>
                <th>Edit Id:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="<c:out value='${product.id}' />" readonly/>
                </td>
            </tr>
            <tr>
                <th>Edit Code:</th>
                <td>
                    <input type="text" name="code" size="45"
                           value="<c:out value='${product.code}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Edit Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${product.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Edit Price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />"
                    />
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Edit Amount:</th>
                <td>
                    <input type="text" name="amount" size="45"
                           value="<c:out value='${product.amount}' />"
                    />
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Edit Description:</th>
                <td>
                    <input type="text" name="description" size="45"
                           value="<c:out value='${product.description}' />"
                    />
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Edit Status:</th>
                <td>
                    <input type="text" name="status" size="45"
                           value="<c:out value='${product.status}' />"
                    />
                </td>
            </tr>
            <tr>

                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>