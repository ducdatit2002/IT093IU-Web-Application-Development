<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getAttribute("user1") != null) {
                User u = (User) request.getAttribute("user1");
        %>

        <h1>User Record</h1>
        <div>User Name <%= u.getUsername()%></div>
        <div>Password: <%= u.getPassword()%></div>
        <%
        } else {
        %>
        
        <h1>No user record found.</h1>
        <% }%>

    </body>
</html>
