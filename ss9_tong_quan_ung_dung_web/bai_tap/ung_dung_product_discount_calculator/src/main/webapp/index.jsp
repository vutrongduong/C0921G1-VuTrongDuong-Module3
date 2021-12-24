<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/23/2021
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/discount" method="post">
  <ul>
    <li>
      Product Description:<input type="text" name="productDescription">
    </li>
    <li>
      List Price:<input type="text" name="listPrice">
    </li>
    <li>
      Discount Percent:<input type="text" name="discountPercent">
    </li>
  </ul>
  <input type="submit" value="Calculate Discount">
  </form>
  </body>
</html>
