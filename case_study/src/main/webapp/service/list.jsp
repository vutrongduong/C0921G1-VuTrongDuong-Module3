<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        select {
            color: black;
            height: 35px;
        }

        .col-lg-7 {
            padding-top: 15px;
        }

        .col-lg-3 {
            padding-top: 15px;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
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
            margin-top: 3px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 6px;
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

        .table-title .add-new {
            float: right;
            height: 39px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 16px;
        }

        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-lg-2">
                    <h2>Manage <b>Service</b></h2>
                </div>
                <div class="col-lg-7 mt-5">
                    <form action="/service">
                        <input type="hidden" name="action" value="search">
                        <input style="color: #0c0c0c;height: 35px" type="text" name="name"
                               placeholder="Search by name or id">
                        <select class="form-select mt-3 " required name="type">
                            <option style="color:black;" selected disabled value="Search type">Search by service type
                            </option>
                            <c:forEach var="serviceType" items="${listCustomerType}">
                                <option style="color: black" value="${serviceType.typeId}"><c:out
                                        value="${serviceType.typeName}"/></option>
                            </c:forEach>
                        </select>
                        <input style="color: #0c0c0c;height: 35px" type="text" name="phone"
                               placeholder="Search by phone">
                        <button class="btn btn-info" style=" border-radius: 15px">
                        <span>
                             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-search pt-3" viewBox="0 0 16 16">
                            <path style="padding-top: 5px"
                                  d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                        </span>
                            <span> Search</span>
                        </button>
                    </form>
                </div>
                <div class="col-lg-3">
                    <a href="/service?action=add" class="btn btn-success add-new" data-toggle="modal"><i
                            class="material-icons">&#xE147;</i>
                        <span>Add New Service</span></a>
                </div>
            </div>
        </div>
        <table id="table" class="table table-striped table-bordered" style="width: 100%">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Area</th>
                <th>Cost</th>
                <th>Max People</th>
                <th>Rent Type</th>
                <th>Service Type</th>
                <th>Standard Room</th>
                <th>Description</th>
                <th>Pool Area</th>
                <th>Number Of Floors</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="service" items="${listService}">
                <td><c:out value="${service.id}"/></td>
                <td><c:out value="${service.name}"/></td>
                <td><c:out value="${service.area}"/></td>
                <td><c:out value="${service.cost}"/></td>
                <td><c:out value="${service.maxPeople}"/></td>
                <td><c:out value="${service.rentType.rentTypeName}"/></td>
                <td><c:out value="${service.type.serviceTypeName}"/></td>
                <td><c:out value="${service.standardRoom}"/></td>
                <td><c:out value="${service.descriptionOtherConvenience}"/></td>
                <td><c:out value="${service.poolArea}"/></td>
                <td><c:out value="${service.numberOfFloors}"/></td>
                <td>
                    <a href="/service?action=edit&serviceId=${service.id}" class="edit" title="Edit"
                       data-toggle="tooltip"><i
                            class="material-icons">&#xE254;</i></a>
                    <a href="#deleteCustomerModal${service.id}" data-bs-target="deleteCustomerModal"
                       class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip"
                                                             title="Delete">&#xE872;</i></a>
                </td>
                </tr>
                <div id="deleteCustomerModal${service.id}" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form>
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Customer</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>B???n c?? ch???c ch???n mu???n x??a kh??ch h??ng n??y kh??ng?</p>
                                    <p class="text-warning">${service.name}</p>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <a class="btn btn-danger" href="/service?action=delete&serviceId=${service.id}">Delete</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>