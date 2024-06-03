<%-- 
    Document   : TestMySQL
    Created on : Mar 30, 2022, 9:07:44 AM
    Author     : asus
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Connect</title>
    </head>

    <body>
        <h1>Test Connection MySQL</h1>
        <%
            String connectionURL = "jdbc:mysql://localhost:3306/lab4-jdbc"; //step 2
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
        %>
        <%
            Class.forName("com.mysql.jdbc.Driver"); //step 1
            connection = DriverManager.getConnection(connectionURL, "Admin", "admin"); //step 3
            statement = connection.createStatement(); //step 4
            rs = statement.executeQuery("SELECT * FROM course"); //step 5
            while (rs.next()) {
                out.println(rs.getString("CourseName"));
                out.println(rs.getString("Credits") + "<br>");
            } //step 6
            rs.close(); //step 7
        %>
    </body>
</html>
