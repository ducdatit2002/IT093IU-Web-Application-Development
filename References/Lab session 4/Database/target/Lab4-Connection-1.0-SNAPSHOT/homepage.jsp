<%-- 
    Document   : login
    Created on : Mar 30, 2022, 10:42:58 AM
    Author     : asus
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>HomePage</title>
    </head>
    <body>
        <%
            String connectionURL = "jdbc:mysql://localhost:3306/lab4-jdbc"; //step 2
            Connection connection = null; //step 3
            Statement statement = null; //step 4
            ResultSet rs = null;
        %>

        <%
            String cUsername = null;
            String _id = null;
            Cookie[] listOfCookie = request.getCookies();
            if (listOfCookie != null) {
                for (Cookie c : listOfCookie) {
                    if (c.getName().equals("username")) {
                        cUsername = c.getValue();
                    }
                    if (c.getName().equals("_id")) {
                        _id = c.getValue();
                    }
                }
            }
            out.println("<h4>Welcome to Edusoft Web, " + cUsername + " !!!</h4>");
            try {
                Class.forName("com.mysql.jdbc.Driver"); //step 1
                connection = DriverManager.getConnection(connectionURL, "Admin", "admin"); //step 3
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM course"); //step 5
                if (rs.next()) {
                    out.println("<table><tr>");
                    while (rs.next()) {
                        out.println("<td>" + rs.getString("CourseName") + "</td>");
                        out.println("<td>" + rs.getString("Credits") + "</td>");
                        out.println("</tr>");
                    } //step 6
                }
                out.println("<tr>"
                        + "<td>"
                        + "<form method=\"post\" action=\"" + request.getContextPath() + "/register.jsp\">"
                        + "<input value=\"Register Course\" type=\"submit\">"
                        + "</form>"
                        + "</td>"
                        + "</tr>"
                        + "</table>");
                rs.close(); //step 7
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
