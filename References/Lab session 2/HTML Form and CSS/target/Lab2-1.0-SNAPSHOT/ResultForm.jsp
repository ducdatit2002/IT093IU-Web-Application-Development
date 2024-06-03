<%-- 
    Document   : Result
    Created on : Mar 16, 2022, 9:38:54 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Form</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Thank you !</h1>
            <h2>Wait for approving by advisor</h2>
            <div class="line"></div>
            <h4>Here is your information</h4>
            <%
                String fullname = request.getParameter("fullname");
                out.print("<strong>Your fullname: </strong>" + fullname + "<br>" + "<br>");
                String Id = request.getParameter("id");
                out.print("<strong>Your id: </strong>" + Id + "<br>" + "<br>");
                String email = request.getParameter("email");
                out.print("<strong>Your email: </strong>" + email + "<br>" + "<br>");
                String gender = request.getParameter("gender");
                out.print("<strong>Your gender: </strong>" + gender + "<br>" + "<br>");
                String major = request.getParameter("major");
                out.print("<strong>Your field of study: </strong>" + major + "<br>" + "<br>");
                String subject[] = request.getParameterValues("subject");
                out.print("<strong>Your list of subject: <br> </strong>");
                for (String s : subject) {
                    out.print(s + "<br>");
                }
                String comment = request.getParameter("comment");
                out.print("<br>" + "<strong>Your comment: </strong>" + comment + "<br>" + "<br>");
            %>
        </div>
    </body>
</html>
