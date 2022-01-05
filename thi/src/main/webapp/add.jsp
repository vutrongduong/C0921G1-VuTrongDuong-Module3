<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/add.css">
</head>
<body>
<div class="signup-form">
    <form method="post" class="form-horizontal">
        <div class="row">
            <div class="col-8 offset-4">
                <h2>Add Customer</h2>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Id Customer</label>
            <div class="col-8">
                <input type="text" readonly class="form-control" name="id" value="${id}" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Customer Type</label>
            <div class="col-8">
                <select class="form-select mt-3" required name="customerType">
                    <option selected disabled value="">Customer Type</option>
                    <c:forEach var="customerType" items="${listCustomerType}">
                        <c:choose>
                            <c:when test="${customerType.typeId==customer.type.typeId}">
                                <option value="${customerType.typeId}" selected><c:out
                                        value="${customerType.typeName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${customerType.typeId}"><c:out
                                        value="${customerType.typeName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <p style="color:red;">${type}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Name</label>
            <div class="col-8 mt-2">
                <input value="${customer.name}" class="form-control" type="text" name="name"
                       required>
                <p style="color:red;">${name}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Gender</label>
            <div class="col-8 mt-2">
                <input type="radio" name="gender" value="1" ${customer.gender==1?"checked":""}>Male
                <input type="radio" name="gender" value="0" ${customer.gender==0?"checked":""}>Female
            </div>
            <p style="color:red;">${gender}</p>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Birthday</label>
            <div class="col-8 mt-2">
                <input value="${customer.birthday}" class="form-control h-75" type="date" name="birthDay"
                       required>
                <p style="color:red;">${date}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Id Card</label>
            <div class="col-8 mt-2">
                <input value="${customer.idCard}" class="form-control" type="text" name="idCard"
                       required>
                <p style="color:red;">${idCard}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Phone</label>
            <div class="col-8 mt-2">
                <input value="${customer.phone}" class="form-control" type="text" name="phone"
                       required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">E-mail Address</label>
            <div class="col-8 mt-2">
                <input value="${customer.email}" class="form-control" type="email" name="email"
                       required>
                <p style="color:red;">${email}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Address</label>
            <div class="col-8 mt-2">
                <input value="${customer.address}" class="form-control" type="text" name="address"
                       required>
                <p style="color:red;">${address}</p>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-8 offset-4 ">
                <p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms
                    of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>