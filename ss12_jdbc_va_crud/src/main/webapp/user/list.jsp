<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <td colspan="4">
                <form method="post" action="/users?">
                    <input type="hidden" name="action" value="search">
                    <input type="text" name="country" placeholder="country">
                    <input type="submit" value="Search">
                </form>
            </td>
            <td>
                <a href="/users?action=sort">Sắp xếp theo tên</a>
            </td>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td class="text-center align-middle">
                    <div class="btn-group align-top">
                        <button class="btn btn-sm btn-outline-secondary badge" type="button"
                                data-toggle="modal" data-target="#user-form-modal"><a
                                href="/users?action=edit&id=${user.id}">Edit</a>
                        </button>
                        <button class="btn btn-sm btn-outline-secondary badge"
                                type="button"><a href="/users?action=delete&id=${user.id}"><i
                                class="fa fa-trash"></i></a></button>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
