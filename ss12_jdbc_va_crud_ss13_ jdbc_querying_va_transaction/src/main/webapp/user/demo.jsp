<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Table with Add and Delete Row Feature</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <style>

        body {
            color: #404E67;
            background: #404E67;
            background-size: 100%;
            font-family: 'Open Sans', sans-serif;
        }

        .table-wrapper {
            width: 700px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }

        .table-title h2 {
            margin: 6px 0 0;
            font-size: 22px;
        }

        .table-title .add-new {
            float: right;
            height: 30px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 13px;
        }

        .table-title .add-new i {
            margin-right: 4px;
        }

        table.table {
            table-layout: fixed;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table th:last-child {
            width: 100px;
        }

        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }


        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #E34724;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table td a.add i {
            font-size: 24px;
            margin-right: -1px;
            position: relative;
            top: 3px;
        }

    </style>
    <script>
        function showMess(id) {
            var optoin = confirm("Bạn có chắc chắn muốn xóa");
            if (optoin === true) {
                window.location.href = '/product?action=delete&id=' + id
            }
        };
    </script>
</head>
<body>
<div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div><h2>User <b>Details</b></h2></div>
                <div class="row">
                    <div class="col-sm-4">
                        <form method="post" action="/users?">
                            <input type="hidden" name="action" value="search">
                            <input type="text" name="country" placeholder="country">
                            <input type="submit" value="Search">
                        </form>
                    </div>
                    <div class="col-sm-4">
                        <button><a href="/users?action=sort">Sắp xếp theo tên</a></button>
                    </div>
                    <div class="col-sm-4">
                        <a href="/users?action=create">
                            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New
                            </button>
                        </a>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
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
    </div>
</div>
</body>
</html>
