<%-- 
    Document   : Example3
    Created on : Apr 15, 2022, 3:23:09 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: pink">
        <h1>Print out the cookies</h1>

        <div style="border: 1px solid grey"></div>

        <form action="Example3">
            <table>
                <tr>
                    <th>Input Cookie Name</th>
                    <td><input type="text" name="cookeiName"></td>
                </tr>
                <tr>
                    <th>Input Cookie Value</th>
                    <td><input type="text" name="cookieValue"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
