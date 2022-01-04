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
                <h2>Add New Employee</h2>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Id Employee</label>
            <div class="col-8">
                <input type="text" readonly class="form-control" name="id" value="${id}" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Name</label>
            <div class="col-8 mt-2">
                <input value="${division.name}" class="form-control" type="text" name="name"
                       required>
                <p style="color:red;">${name}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Birthday</label>
            <div class="col-8 mt-2">
                <input value="${division.area}" class="form-control" type="date" name=birthDay
                       required>
                <p style="color:red;">${area}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Id Card</label>
            <div class="col-8 mt-2">
                <input value="${division.cost}" class="form-control" type="text" name="idCard"
                       required>
                <p style="color:red;">${cost}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Salary</label>
            <div class="col-8 mt-2">
                <input value="${division.maxPeople}" class="form-control" type="text" name="salary"
                       required>
                <p style="color:red;">${maxPeople}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Phone</label>
            <div class="col-8 mt-2">
                <input value="${division.maxPeople}" class="form-control" type="text" name="phone"
                       required>
                <p style="color:red;">${maxPeople}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Email</label>
            <div class="col-8 mt-2">
                <input value="${division.maxPeople}" class="form-control" type="text" name="email"
                       required>
                <p style="color:red;">${maxPeople}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Address</label>
            <div class="col-8 mt-2">
                <input value="${division.maxPeople}" class="form-control" type="text" name="address"
                       required>
                <p style="color:red;">${maxPeople}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Position </label>
            <div class="col-8">
                <select class="form-select mt-3" required name="position">
                    <option selected disabled value="">Position</option>
                    <c:forEach var="position" items="${positions}">
                        <c:choose>
                            <c:when test="${position.positionId==employee.position.positionId}">
                                <option value="${position.positionId}" selected><c:out
                                        value="${position.positionName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${position.positionId}"><c:out
                                        value="${position.positionName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <p style="color:red;">${position}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">EducationDegree </label>
            <div class="col-8">
                <select class="form-select mt-3" required name="educationDegree">
                    <option selected disabled value="">EducationDegree</option>
                    <c:forEach var="educationDegree" items="${educationDegrees}">
                        <c:choose>
                            <c:when test="${educationDegree.educationDegreeId==employee.educationDegree.educationDegreeId}">
                                <option value="${educationDegree.educationDegreeId}" selected><c:out
                                        value="${educationDegree.educationDegreeName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${educationDegree.educationDegreeId}"><c:out
                                        value="${educationDegree.educationDegreeName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <p style="color:red;">${educationDegree}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-form-label col-4">Division </label>
            <div class="col-8">
                <select class="form-select mt-3" required name="division">
                    <option selected disabled value="">Division</option>
                    <c:forEach var="division" items="${divisions}">
                        <c:choose>
                            <c:when test="${division.divisionId==employee.division.divisionId}">
                                <option value="${division.divisionId}" selected><c:out
                                        value="${division.divisionName}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${division.divisionId}"><c:out
                                        value="${division.divisionName}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <p style="color:red;">${division}</p>
            </div>
            <div class="form-group row">
                <div class="col-8 offset-4 ">
                    <p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a
                            href="#">Are
                        you sure the above information is completely correct?</a></label></p>
                    <button type="submit" class="btn btn-primary btn-lg">Add New Employee</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
