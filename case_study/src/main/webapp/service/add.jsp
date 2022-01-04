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
    <style>
        body {
            color: #999;
            background: #f3f3f3;
            font-family: 'Roboto', sans-serif;
        }

        .form-control {
            border-color: #eee;
            min-height: 41px;
            box-shadow: none !important;
        }

        .form-control:focus {
            border-color: #5cd3b4;
        }

        .form-control, .btn {
            border-radius: 3px;
        }

        .signup-form {
            width: 500px;
            margin: 0 auto;
            padding: 30px 0;
        }

        .signup-form h2 {
            color: #333;
            margin: 0 0 30px 0;
            display: inline-block;
            padding: 0 30px 10px 0;
            border-bottom: 3px solid #5cd3b4;
        }

        .signup-form form {
            color: #999;
            border-radius: 3px;
            margin-bottom: 15px;
            background: #fff;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }

        .signup-form .form-group row {
            margin-bottom: 20px;
        }

        .signup-form label {
            font-weight: normal;
            font-size: 14px;
            line-height: 2;
        }

        .signup-form input[type="checkbox"] {
            position: relative;
            top: 1px;
        }

        .signup-form .btn {
            font-size: 16px;
            font-weight: bold;
            background: #5cd3b4;
            border: none;
            margin-top: 20px;
            min-width: 140px;
        }

        .col-4 {
            background: #5cd3b4;
            border: none;
            color: black;
        }

        .signup-form .btn:hover, .signup-form .btn:focus {
            background: #41cba9;
            outline: none !important;
        }

        .signup-form a {
            color: #5cd3b4;
            text-decoration: underline;
        }

        .signup-form a:hover {
            text-decoration: none;
        }

        .signup-form form a {
            color: #5cd3b4;
            text-decoration: none;
        }

        .signup-form form a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="signup-form">
    <form method="post" class="form-horizontal">
        <div class="row">
            <div class="col-8 offset-4">
                <h2>Add New Service</h2>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Id Service</label>
            <div class="col-8">
                <input type="text" readonly class="form-control" name="id" value="${id}" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Name</label>
            <div class="col-8 mt-2">
                <input value="${service.name}" class="form-control" type="text" name="name"
                       required>
                <p style="color:red;">${name}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Area</label>
            <div class="col-8 mt-2">
                <input value="${service.area}" class="form-control" type="text" name=area
                       required>
                <p style="color:red;">${area}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Cost</label>
            <div class="col-8 mt-2">
                <input value="${service.cost}" class="form-control" type="text" name="cost"
                       required>
                <p style="color:red;">${cost}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Max People</label>
            <div class="col-8 mt-2">
                <input value="${service.maxPeople}" class="form-control" type="text" name="maxPeople"
                       required>
                <p style="color:red;">${maxPeople}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-form-label col-4">Service Type</label>
            <div class="col-8">
                <select class="form-select mt-3" required name="type">
                    <option selected disabled value="">Service Type</option>
                    <c:forEach var="serviceType" items="${listServiceType}">
                        <c:choose>
                            <c:when test="${serviceType.serviceTypeId==service.type.serviceTypeId}">
                                <option value="${serviceType.serviceTypeId}" selected><c:out
                                        value="${serviceType.serviceTypeName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${serviceType.serviceTypeId}"><c:out
                                        value="${serviceType.serviceTypeName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                                <p style="color:red;">${type}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Rent Type</label>
            <div class="col-8">
                <select class="form-select mt-3" required name="rentType">
                    <option selected disabled value="">Rent Type</option>
                    <c:forEach var="rentType" items="${listRentType}">
                        <c:choose>
                            <c:when test="${rentType.rentTypeId==service.rentType.rentTypeId}">
                                <option value="${rentType.rentTypeId}" selected><c:out
                                        value="${rentType.rentTypeName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${rentType.rentTypeId}"><c:out
                                        value="${rentType.rentTypeName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                                <p style="color:red;">${type}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Standard Room</label>
            <div class="col-8 mt-2">
                <input value="${service.standardRoom}" class="form-control" type="text" name="standardRoom"
                       required>
                <p style="color:red;">${standardRoom}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Description</label>
            <div class="col-8 mt-2">
                <input value="${service.descriptionOtherConvenience}" class="form-control" type="text"
                       name="description"
                       required>
                <p style="color:red;">${description}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Pool Area</label>
            <div class="col-8 mt-2">
                <input value="${service.poolArea}" class="form-control" type="text" name="poolArea"
                       required>
                <p style="color:red;">${poolArea}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Number Of Floors</label>
            <div class="col-8 mt-2">
                <input value="${service.numberOfFloors}" class="form-control" type="text" name="numberOfFloors"
                       required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-8 offset-4 ">
                <p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Are
                    you sure the above information is completely correct?</a></label></p>
                <button type="submit" class="btn btn-primary btn-lg">Add New Service</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
