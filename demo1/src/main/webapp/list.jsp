<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <title>Bootstrap Table with Add and Delete Row Feature</title>--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">--%>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>--%>
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>--%>

<%--    <style>--%>

<%--        body {--%>
<%--            color: #404E67;--%>
<%--            background-image: url("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/155154d8-5f24-440e-8b47-e4b9b4af6557/ddbxouz-24b62b95-2b63-4df4-b9fb-4c0019f012c3.png/v1/fill/w_1280,h_712,q_80,strp/the_edge_of_the_forest___gray_terminal__2_by_sheylog_ddbxouz-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzEyIiwicGF0aCI6IlwvZlwvMTU1MTU0ZDgtNWYyNC00NDBlLThiNDctZTRiOWI0YWY2NTU3XC9kZGJ4b3V6LTI0YjYyYjk1LTJiNjMtNGRmNC1iOWZiLTRjMDAxOWYwMTJjMy5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.xSQo4olzbqrL34SFHo8p7DKkKnAVzxJoeg8rY1LnW2s");--%>
<%--            background-size: 100%;--%>
<%--            font-family: 'Open Sans', sans-serif;--%>
<%--        }--%>

<%--        .table-wrapper {--%>
<%--            width: 700px;--%>
<%--            margin: 30px auto;--%>
<%--            background: #fff;--%>
<%--            padding: 20px;--%>
<%--            box-shadow: 0 1px 1px rgba(0,0,0,.05);--%>
<%--        }--%>
<%--        .table-title {--%>
<%--            padding-bottom: 10px;--%>
<%--            margin: 0 0 10px;--%>
<%--        }--%>
<%--        .table-title h2 {--%>
<%--            margin: 6px 0 0;--%>
<%--            font-size: 22px;--%>
<%--        }--%>
<%--        .table-title .add-new {--%>
<%--            float: right;--%>
<%--            height: 30px;--%>
<%--            font-weight: bold;--%>
<%--            font-size: 12px;--%>
<%--            text-shadow: none;--%>
<%--            min-width: 100px;--%>
<%--            border-radius: 50px;--%>
<%--            line-height: 13px;--%>
<%--        }--%>
<%--        .table-title .add-new i {--%>
<%--            margin-right: 4px;--%>
<%--        }--%>
<%--        table.table {--%>
<%--            table-layout: fixed;--%>
<%--        }--%>
<%--        table.table tr th, table.table tr td {--%>
<%--            border-color: #e9e9e9;--%>
<%--        }--%>
<%--        table.table th i {--%>
<%--            font-size: 13px;--%>
<%--            margin: 0 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--        table.table th:last-child {--%>
<%--            width: 100px;--%>
<%--        }--%>
<%--        table.table td a {--%>
<%--            cursor: pointer;--%>
<%--            display: inline-block;--%>
<%--            margin: 0 5px;--%>
<%--            min-width: 24px;--%>
<%--        }--%>
<%--        table.table td a.add {--%>
<%--            color: #27C46B;--%>
<%--        }--%>
<%--        table.table td a.edit {--%>
<%--            color: #FFC107;--%>
<%--        }--%>
<%--        table.table td a.delete {--%>
<%--            color: #E34724;--%>
<%--        }--%>
<%--        table.table td i {--%>
<%--            font-size: 19px;--%>
<%--        }--%>
<%--        table.table td a.add i {--%>
<%--            font-size: 24px;--%>
<%--            margin-right: -1px;--%>
<%--            position: relative;--%>
<%--            top: 3px;--%>
<%--        }--%>
<%--        table.table .form-control {--%>
<%--            height: 32px;--%>
<%--            line-height: 32px;--%>
<%--            box-shadow: none;--%>
<%--            border-radius: 2px;--%>
<%--        }--%>
<%--        table.table .form-control.error {--%>
<%--            border-color: #f50000;--%>
<%--        }--%>
<%--        table.table td .add {--%>
<%--            display: none;--%>
<%--        }--%>

<%--    </style>--%>
<%--    <script>--%>
<%--        function showMess(id) {--%>
<%--            var optoin = confirm("Bạn có chắc chắn muốn xóa");--%>
<%--            if (optoin === true) {--%>
<%--                window.location.href = '/product?action=delete&id=' + id--%>
<%--            }--%>
<%--        };--%>
<%--        $(document).ready(function(){--%>
<%--            $('[data-toggle="tooltip"]').tooltip();--%>
<%--            var actions = $("table td:last-child").html();--%>
<%--            // Append table with add row form on add new button click--%>
<%--            $(".add-new").click(function(){--%>
<%--                $(this).attr("disabled", "disabled");--%>
<%--                var index = $("table tbody tr:last-child").index();--%>
<%--                var row = '<tr>' +--%>
<%--                    '<td><input type="text" class="form-control" name="name" id="name"></td>' +--%>
<%--                    '<td><input type="text" class="form-control" name="department" id="department"></td>' +--%>
<%--                    '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +--%>
<%--                    '<td>' + actions + '</td>' +--%>
<%--                    '</tr>';--%>
<%--                $("table").append(row);--%>
<%--                $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();--%>
<%--                $('[data-toggle="tooltip"]').tooltip();--%>
<%--            });--%>
<%--            // Add row on add button click--%>
<%--            $(document).on("click", ".add", function(){--%>
<%--                var empty = false;--%>
<%--                var input = $(this).parents("tr").find('input[type="text"]');--%>
<%--                input.each(function(){--%>
<%--                    if(!$(this).val()){--%>
<%--                        $(this).addClass("error");--%>
<%--                        empty = true;--%>
<%--                    } else{--%>
<%--                        $(this).removeClass("error");--%>
<%--                    }--%>
<%--                });--%>
<%--                $(this).parents("tr").find(".error").first().focus();--%>
<%--                if(!empty){--%>
<%--                    input.each(function(){--%>
<%--                        $(this).parent("td").html($(this).val());--%>
<%--                    });--%>
<%--                    $(this).parents("tr").find(".add, .edit").toggle();--%>
<%--                    $(".add-new").removeAttr("disabled");--%>
<%--                }--%>
<%--            });--%>
<%--            // Edit row on edit button click--%>
<%--            $(document).on("click", ".edit", function(){--%>
<%--                $(this).parents("tr").find("td:not(:last-child)").each(function(){--%>
<%--                    $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');--%>
<%--                });--%>
<%--                $(this).parents("tr").find(".add, .edit").toggle();--%>
<%--                $(".add-new").attr("disabled", "disabled");--%>
<%--            });--%>
<%--            // Delete row on delete button click--%>
<%--            $(document).on("click", ".delete", function(){--%>
<%--                $(this).parents("tr").remove();--%>
<%--                $(".add-new").removeAttr("disabled");--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container-lg">--%>
<%--    <div class="table-responsive">--%>
<%--        <div class="table-wrapper">--%>
<%--            <div class="table-title">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-sm-8"><h2>Product <b>Details</b></h2></div>--%>
<%--                    <div class="col-sm-4">--%>
<%--                        <a><button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <table class="table table-bordered">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th style="width: 40px">ID</th>--%>
<%--                    <th style="width: 60px">Code</th>--%>
<%--                    <th style="width: 100px">Name</th>--%>
<%--                    <th>Price</th>--%>
<%--                    <th style="width: 86px">Amount</th>--%>
<%--                    <th style="width: 110px">Description</th>--%>
<%--                    <th>Status</th>--%>
<%--                    <th style="width: 100px">Actions</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <c:forEach var="product" items="${ListProduct}">--%>

<%--                    <tr>--%>
<%--                        <td><c:out value="${product.id}"/></td>--%>
<%--                        <td><c:out value="${product.code}"/></td>--%>
<%--                        <td><c:out value="${product.name}"/></td>--%>
<%--                        <td><c:out value="${product.price}"/></td>--%>
<%--                        <td><c:out value="${product.amount}"/></td>--%>
<%--                        <td><c:out value="${product.description}"/></td>--%>
<%--                        <td><c:out value="${product.status}"/></td>--%>
<%--                        <td>--%>
<%--                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>--%>
<%--                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>--%>
<%--                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>--%>
<%--&lt;%&ndash;                            <a href="/product?action=edit&id=${product.id}" class="edit" title="Edit"&ndash;%&gt;--%>
<%--&lt;%&ndash;                               data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a href="#" onclick="showMess(${product.id})" class="delete" title="Delete"&ndash;%&gt;--%>
<%--&lt;%&ndash;                               data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>&ndash;%&gt;--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/21/2021
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
</head>
<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Employees</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i
                                class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
                    </th>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Amount</th>
                    <th>Desrtion</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${ListProduct}">
                    <tr>
                        <td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
                        </td>

                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.code}"/></td>
                        <td><c:out value="${product.name}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.amount}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.status}"/></td>
                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
                                                                                             data-toggle="tooltip"
                                                                                             title="Edit">&#xE254;</i></a>
                            <a data-target="#deleteEmployeeModal-${product.id}" class="delete" data-toggle="modal"><i class="material-icons"
                                                                                                 data-toggle="tooltip"
                                                                                                 title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    <div id="EmpdeleteloyeeModal-${product.id}" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form>
                                    <div class="modal-header">
                                        <h4 class="modal-title">Delete Employee</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete these Records?</p>
                                        <p class="text-warning"><small>This action cannot be undone.
                                                ${product.name} </small></p>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal"
                                               value="Cancel">
                                        <a href="/product?action=delete&id=${product.id}" type="submit" class="btn btn-danger" value="Delete"></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Add Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Edit Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->

</body>
</html>
