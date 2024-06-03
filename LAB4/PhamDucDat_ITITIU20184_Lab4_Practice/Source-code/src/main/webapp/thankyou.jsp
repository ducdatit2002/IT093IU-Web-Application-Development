<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <h1>Thanks for joining our email list</h1>
    <p>Here is the information that you entered:</p>
    
    <table>
        <tr><td>Email:</td><td><%= request.getAttribute("email") %></td></tr>
        <tr><td>First Name:</td><td><%= request.getAttribute("firstName") %></td></tr>
        <tr><td>Last Name:</td><td><%= request.getAttribute("lastName") %></td></tr>
    </table>
    
    <p>To enter another email address, click on the Back button in your browser or the Return button shown below.</p>
    
    <form action="emailList.jsp">
        <input type="submit" value="Return">
    </form>

</body>
</html>
