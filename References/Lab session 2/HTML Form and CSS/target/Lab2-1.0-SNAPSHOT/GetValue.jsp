<%-- 
    Document   : GetValue.jsp
    Created on : Mar 16, 2022, 9:22:20 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <h2>Result page</h2>
        <%
            String value = request.getParameter("tx1");
            out.print("Hello " + value + "!");
        %>
    </body>
</html>
