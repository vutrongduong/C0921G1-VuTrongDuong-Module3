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
    <link rel="stylesheet" href="css/list.css">
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-lg-2">
                    <h2>Manage <b>Customers</b></h2>
                </div>
                <div class="col-lg-7 mt-5">
                    <form action="/customer">
                        <input type="hidden" name="action" value="search">
                        <input style="color: #0c0c0c;height: 35px" type="text" name="name"
                               placeholder="Search by name or id">
                        <select class="form-select mt-3 " required name="type">
                            <option style="color:black;" selected disabled value="Search type">Search by customer type
                            </option>
                            <c:forEach var="customerType" items="${listCustomerType}">
                                <option style="color: black" value="${customerType.typeId}"><c:out
                                        value="${customerType.typeName}"/></option>
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
                    <a href="/customer?action=add" class="btn btn-success add-new" data-toggle="modal"><i
                            class="material-icons">&#xE147;</i>
                        <span>Add New Customer</span></a>
                </div>
            </div>
        </div>
        <table id="table" class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Customer Type</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Id card</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${listCustomer}">
                <td><c:out value="${customer.id}"/></td>
                <td><c:out value="${customer.type.typeName}"/></td>
                <td><c:out value="${customer.name}"/></td>
                <td><c:out value="${customer.birthday}"/></td>
                <td><c:out value="${customer.gender}"/></td>
                <td><c:out value="${customer.idCard}"/></td>
                <td><c:out value="${customer.phone}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <td><c:out value="${customer.address}"/></td>
                <td>
                    <a href="/customer?action=edit&customerId=${customer.id}" class="edit" title="Edit"
                       data-toggle="tooltip"><i
                            class="material-icons">&#xE254;</i></a>
                    <a href="#deleteCustomerModal${customer.id}" data-bs-target="deleteCustomerModal"
                       class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip"
                                                             title="Delete">&#xE872;</i></a>
                </td>
                </tr>
                <%--                <div id="deleteCustomerModal${customer.id}" class="modal fade">--%>
                <%--                    <div class="modal-dialog">--%>
                <%--                        <div class="modal-content">--%>
                <%--                            <form>--%>
                <%--                                <div class="modal-header">--%>
                <%--                                    <h4 class="modal-title">Delete Customer</h4>--%>
                <%--                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                <%--                                    </button>--%>
                <%--                                </div>--%>
                <%--                                <div class="modal-body">--%>
                <%--                                    <p>Bạn có chắc chắn muốn xóa khách hàng này không?</p>--%>
                <%--                                    <p class="text-warning">${customer.name}</p>--%>
                <%--                                </div>--%>
                <%--                                <div class="modal-footer">--%>
                <%--                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">--%>
                <%--                                    <a class="btn btn-danger" href="/customer?action=delete&customerId=${customer.id}">Delete</a>--%>
                <%--                                </div>--%>
                <%--                            </form>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

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
