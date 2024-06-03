<%-- 
    Document   : InputPage
    Created on : Mar 16, 2022, 9:08:26 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Page</title>
    </head>
    <body>
        <h2>Please Input The Value!</h2>
        <form method="post" action="GetValue.jsp">
            <input type="text" name = "tx1">
            <br>
            <br>
            <input type="Submit" value="Submit">
        </form>
    </body>
</html>
