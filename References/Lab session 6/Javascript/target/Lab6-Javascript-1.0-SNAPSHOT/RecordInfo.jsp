<%-- 
    Document   : RecordInfo
    Created on : May 2, 2022, 8:17:20 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Record info page</title>
    </head>
    <body>
        <h1>Record info and store cookies</h1>
        <%
            String fname = request.getParameter("fullname");
            out.print("Your fullname: " + fname + "<br>");
            String username = request.getParameter("username");
            out.print("Your username: " + username + "<br>");
            String email = request.getParameter("email");
            out.print("Your email: " + email + "<br>");
            String pass = request.getParameter("password");
            out.print("Your password without hiding by secret character: " + pass + "<br>");
            out.print("<hr>");
            out.print("<h1>Read cookies</h1>");
            String cookieName = "fullname";
            String cookieName1 = "email";
            String cookieName2 = "username";
            String cookieName3 = "password";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                Cookie cookie;
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookieName.equals(cookie.getName())) {
                        out.println(cookie.getName() + "\t" + cookie.getValue() + "<br>");
                    }
                    if (cookieName1.equals(cookie.getName())) {
                        out.println(cookie.getName() + "\t" + cookie.getValue() + "<br>");
                    }
                    if (cookieName2.equals(cookie.getName())) {
                        out.println(cookie.getName() + "\t" + cookie.getValue() + "<br>");
                    }
                    if (cookieName3.equals(cookie.getName())) {
                        out.println(cookie.getName() + "\t" + cookie.getValue() + "<br>");
                    }
                }
            };
            out.println("<a href=\"index.html\">Return to homepage</a>");
        %>
    </body>
</html>
