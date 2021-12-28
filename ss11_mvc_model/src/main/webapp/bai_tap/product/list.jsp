
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
            background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/155154d8-5f24-440e-8b47-e4b9b4af6557/ddbxouz-24b62b95-2b63-4df4-b9fb-4c0019f012c3.png/v1/fill/w_1280,h_712,q_80,strp/the_edge_of_the_forest___gray_terminal__2_by_sheylog_ddbxouz-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzEyIiwicGF0aCI6IlwvZlwvMTU1MTU0ZDgtNWYyNC00NDBlLThiNDctZTRiOWI0YWY2NTU3XC9kZGJ4b3V6LTI0YjYyYjk1LTJiNjMtNGRmNC1iOWZiLTRjMDAxOWYwMTJjMy5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.xSQo4olzbqrL34SFHo8p7DKkKnAVzxJoeg8rY1LnW2s");
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
                <div class="row">
                    <div class="col-sm-8"><h2>Product <b>Details</b></h2></div>
                    <div class="col-sm-4">
                        <a href="/product?action=add">

                            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New
                            </button>
                        </a>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th style="width: 40px">ID</th>
                    <th style="width: 60px">Code</th>
                    <th style="width: 100px">Name</th>
                    <th>Price</th>
                    <th style="width: 86px">Amount</th>
                    <th style="width: 110px">Description</th>
                    <th>Status</th>
                    <th style="width: 100px">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${products}">

                    <tr>
                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.code}"/></td>
                        <td><c:out value="${product.name}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.amount}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.status}"/></td>
                        <td>
                            <a href="/product?action=update&id=${product.getId()}" class="edit" title="Edit"
                               data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a href="#" onclick="showMess(${product.id})" class="delete" title="Delete"
                               data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
