<%-- 
    Document   : SendCookie
    Created on : Apr 15, 2022, 2:08:32 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cookie Page</title>
    </head>
    <body>
        <h1>Sending - Reading Cookie Page</h1>

        <%
            Cookie c = new Cookie("userID", "ITITIU19169");
            c.setMaxAge(60 * 60 * 24 * 7); // One week
            response.addCookie(c);

            String cookieName = "userID";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                Cookie cookie;
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookieName.equals(cookie.getName())) {
                        out.println(cookie.getName() + "\t" + cookie.getValue());
                    } else {
                        out.println("Your cookie has been removed");
                    }
                }
            };

            // Remove cookie
            Cookie ck = new Cookie("userID", "");
            ck.setMaxAge(0);//changing the maximum age to 0 seconds  
            response.addCookie(ck);//adding cookie in the response 
        %>
    </body>
</html>
