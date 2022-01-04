<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

    *, body {
        font-family: 'Poppins', sans-serif;
        font-weight: 400;
        -webkit-font-smoothing: antialiased;
        text-rendering: optimizeLegibility;
        -moz-osx-font-smoothing: grayscale;
    }

    html, body {
        height: 100%;
        background-color: #152733;
    }


    .form-holder {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        min-height: 100vh;
    }

    .form-holder .form-content {
        position: relative;
        text-align: center;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-align-items: center;
        align-items: center;
        padding: 60px;
    }

    .form-content .form-items {
        border: 3px solid #fff;
        padding: 40px;
        display: inline-block;
        width: 100%;
        min-width: 540px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        text-align: left;
        -webkit-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .form-content h3 {
        color: #fff;
        text-align: left;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 5px;
    }


    .form-content p {
        color: #fff;
        text-align: left;
        font-size: 17px;
        font-weight: 300;
        line-height: 20px;
        margin-bottom: 30px;
    }


    .form-content label, .was-validated .form-check-input:invalid ~ .form-check-label, .was-validated .form-check-input:valid ~ .form-check-label {
        color: #fff;
    }

    .form-content input[type=text], .form-content input[type=password], .form-content input[type=email], .form-content select {
        width: 100%;
        padding: 9px 20px;
        text-align: left;
        border: 0;
        outline: 0;
        border-radius: 6px;
        background-color: #fff;
        font-size: 15px;
        font-weight: 300;
        color: #8D8D8D;
        -webkit-transition: all 0.3s ease;
        transition: all 0.3s ease;
        margin-top: 16px;
    }

    .btn-primary {
        background-color: #6C757D;
        outline: none;
        border: 0px;
        box-shadow: none;
    }

    .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
        background-color: #495056;
        outline: none !important;
        border: none !important;
        box-shadow: none;
    }

    .form-content textarea {
        position: static !important;
        width: 100%;
        padding: 8px 20px;
        border-radius: 6px;
        text-align: left;
        background-color: #fff;
        border: 0;
        font-size: 15px;
        font-weight: 300;
        color: #8D8D8D;
        outline: none;
        resize: none;
        height: 120px;
        -webkit-transition: none;
        transition: none;
        margin-bottom: 14px;
    }

    .form-content textarea:hover, .form-content textarea:focus {
        border: 0;
        background-color: #ebeff8;
        color: #8D8D8D;
    }

    .invalid-feedback {
        color: #ff606e;
    }
</style>
<body>
<div class="form-body">
    <div class="row">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h3>Add Customer</h3>
                    <form class="requires-validation" novalidate method="post">
                        <div class="col-md-12">
                            <input class="form-control" type="text" name="id" placeholder="Id" required>
                        </div>
                        <div class="col-md-12">
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
                        <div class="col-md-12">
                            <input value="${customer.name}" class="form-control" type="text" name="name"
                                   placeholder="Name" required>
                            <p style="color:red;">${name}</p>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <div class="col-lg-6">
                                <label class="mb-3 mr-1">Gender: </label>
                                <input class="btn-check " type="radio" name="gender" value="1"><label
                                    class="btn btn-sm btn-outline-secondary">Male</label>
                                <input class="btn-check" type="radio" name="gender" value="0"><label
                                    class="btn btn-sm btn-outline-secondary">Female</label>
                            </div>
                            <div class="col-lg-6">
                                <input value="${customer.birthday}" class="form-control h-75" type="date" name="birthDay"
                                       placeholder="BirthDay" required>
                                <p style="color:red;">${date}</p>
                            </div>
                        </div>
                        <p style="color:red;">${gender}</p>
                        <div class="col-md-12">
                            <input value="${customer.idCard}" class="form-control" type="text" name="idCard"
                                   placeholder="Id Card" required>
                            <p style="color:red;">${idCard}</p>
                        </div>
                        <div class="col-md-12">
                            <input value="${customer.phone}" class="form-control" type="text" name="phone"
                                   placeholder="Phone" required>
                        </div>
                        <div class="col-md-12">
                            <input value="${customer.email}" class="form-control" type="email" name="email"
                                   placeholder="E-mail Address" required>
                            <p style="color:red;">${email}</p>
                        </div>
                        <div class="col-md-12">
                            <input value="${customer.address}" class="form-control" type="text" name="address"
                                   placeholder="Address" required>
                            <p style="color:red;">${address}</p>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                            <label class="form-check-label">I confirm that all data are correct</label>
                            <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                        </div>
                        <div class="form-button mt-3">
                            <button id="submit" type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    (function () {--%>
<%--        'use strict'--%>
<%--        const forms = document.querySelectorAll('.requires-validation')--%>
<%--        Array.from(forms)--%>
<%--            .forEach(function (form) {--%>
<%--                form.addEventListener('submit', function (event) {--%>
<%--                    if (!form.checkValidity()) {--%>
<%--                        event.preventDefault()--%>
<%--                        event.stopPropagation()--%>
<%--                    }--%>
<%--                    form.classList.add('was-validated')--%>
<%--                }, false)--%>
<%--            })--%>
<%--    })()--%>
<%--</script>--%>
</body>
</html>
