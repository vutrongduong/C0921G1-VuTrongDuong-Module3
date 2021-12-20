<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/17/2021
  Time: 11:07 AM
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
        <a href="product?action=list">List All Product</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="7">
            <caption>
                <h2>Add New Product</h2>
            </caption>
            <tr>
                <th>Code:</th>
                <td>
                    <input type="text" name="code" id="code" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" id="price" size="45"/>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Amount:</th>
                <td>
                    <input type="text" name="amount" id="amount" size="45"/>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Description:</th>
                <td>
                    <input type="text" name="description" id="description" size="45"/>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>Status:</th>
                <td>
                    <input type="text" name="status" id="status" size="45"/>
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
