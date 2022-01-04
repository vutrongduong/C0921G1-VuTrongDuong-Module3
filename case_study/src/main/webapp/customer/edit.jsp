<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<style>
    body {
        background-color: #FFEBEE
    }

    .card {
        width: 400px;
        background-color: #fff;
        border: none;
        border-radius: 12px
    }

    label.radio input {
        position: absolute;
        top: 0;
        left: 0;
        visibility: hidden;
        pointer-events: none
    }

    label.radio span {
        padding: 7px 14px;
        border: 2px solid #eee;
        display: inline-block;
        color: #039be5;
        border-radius: 10px;
        width: 100%;
        height: 48px;
        line-height: 27px
    }

    label.radio input:checked + span {
        border-color: #039BE5;
        background-color: #81D4FA;
        color: #fff;
        border-radius: 9px;
        height: 48px;
        line-height: 27px
    }

    .form-control {
        margin-top: 10px;
        height: 48px;
        border: 2px solid #eee;
        border-radius: 10px
    }

    .form-control:focus {
        box-shadow: none;
        border: 2px solid #039BE5
    }


    .confirm-button {
        height: 50px;
        border-radius: 10px
    }
</style>
<body>
<form method="post">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="col-md-5 pr-lg-5 ms-5 mb-md-0">
            <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt=""
                 class="img-fluid mb-3 d-none d-md-block">
        </div>
        <div class="card px-1 py-4">
            <div class="card-body">
                <div>
                    <h3>Edit Customer ID : <span style="color: #039BE5">${id}</span></h3>
                </div>
                <div class="row form-group">
                    <input hidden class="form-control" name="id" type="text" value="${customer.id}">
                </div>
                <div class="row form-group">
                    <select class="form-select  mt-3" required name="customerType">
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
                </div>
                <div class="row form-group">
                    <input class="form-control" name="name" type="text" value="${customer.name} "></div>
                <div class="row form-group">
                    <input class="form-control" name="birthday" type="text" value="${customer.birthday} "></div>
                <div class="row form-group">
                    <div class="col-md-12 mt-3">
                        <label class="mb-3 mr-1">Gender: </label>
                        <input type="radio" name="gender" value="1" ${customer.gender==1?"checked":""}>Male
                        <input type="radio" name="gender" value="0" ${customer.gender==0?"checked":""}>Female
                    </div>
                    <div class="row form-group">
                        <input class="form-control" name="idCard" type="text" value="${customer.idCard} "></div>
                    <div class="row form-group">
                        <input class="form-control" name="phone" type="text" value="${customer.phone} "></div>
                    <div class="row form-group">
                        <input class="form-control" name="email" type="text" readonly value="${customer.email} "></div>
                    <div class="row form-group">
                        <input class="form-control" name="address" type="text" readonly value="${customer.address} ">
                    </div>
                    <div class="row form-group mt-lg-3">
                        <button type="submit" class="btn btn-primary btn-block confirm-button">Save Customer</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>