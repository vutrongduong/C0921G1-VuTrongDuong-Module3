<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Result:</h1>
<p>
    <%=request.getAttribute("firstOperand")%>
    <%=request.getAttribute("operator")%>
    <%=request.getAttribute("secondOperand")%>=
    <%=request.getAttribute("result")%>
</p>
<%--<c:if test="${er}" >--%>
<%--    <h2><%=request.getAttribute("error")%></h2>--%>
<%--</c:if>--%>
<%--<h2><% if(request.getAttribute("error")==null) <%=request.getAttribute("error")%></h2>--%>
</body>
</html>
