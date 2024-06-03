<%-- 
    Document   : getContact
    Created on : Mar 16, 2022, 4:48:11 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Me</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="alert alert-info" role="alert" style="text-align: center">
                <h4 class="alert-heading">CONTACT WITH ME</h4>
            </div>
            <div class="col">
                <div class="row">
                    <%
                        String name = request.getParameter("txt");
                        out.print("<strong>Name to contact: </strong>" + name + "<br>" + "<br>");
                    %>
                </div>
                <div class="row">
                    <%
                        String email = request.getParameter("email");
                        out.print("<strong>Email to contact:  </strong>" + email + "<br>" + "<br>");
                    %>
                </div>
                <div class="row">
                    <%
                        String message = request.getParameter("message");
                        out.print("<strong>Content of Message:  </strong>" + message + "<br>" + "<br>");
                    %>
                </div>
            </div>
        </div>     
    </div>
</body>
</html>
