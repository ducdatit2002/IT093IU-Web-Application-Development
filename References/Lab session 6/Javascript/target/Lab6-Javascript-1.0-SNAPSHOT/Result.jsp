<%-- 
    Document   : Result
    Created on : May 3, 2022, 12:56:21 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <h1>Your answer sheet</h1>
        <hr>
        <%
            String q1 = request.getParameter("q1");
            out.print("There are: " + q1 + " people in my class" + "<br>" + "<br>");
            String q2 = request.getParameter("q2");
            out.print("Your feeling: " + q2 + "<br>" + "<br>");
            out.println("<a href=\"index.html\">Return to homepage</a>");

        %>
    </body>
</html>
