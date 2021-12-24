<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Result:</h1>
<c:out value="${firstOperand}"/>
<c:out value="${operator}"/>
<c:out value="${secondOperand}"/>=
<c:out value="${result}"/>
</body>
</html>