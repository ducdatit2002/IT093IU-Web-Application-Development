<%-- 
    Document   : login
    Created on : Mar 30, 2022, 10:42:58 AM
    Author     : asus
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%!
            ArrayList<String> listOfStudentID = new ArrayList<>();
        %>
        <%
            String connectionURL = "jdbc:mysql://localhost:3306/lab4-jdbc"; //step 2
            Connection connection = null; //step 3
            Statement statement = null; //step 4
            ResultSet rs = null;
        %>
        <%!
            Boolean isInList(String id) {
                for (String idInList : listOfStudentID) {
                    if (idInList.equalsIgnoreCase(id)) {
                        return true;
                    }
                }
                return false;
            }
        %>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver"); //step 1
                connection = DriverManager.getConnection(connectionURL, "Admin", "admin"); //step 3
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM student"); //step 5
                while (rs.next()) {
                    listOfStudentID.add(rs.getString("StudentID"));
                    //            System.out.println(rs.getString("StudentID"));
                } //step 6
                rs.close(); //step 7
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
        <%
            String cUsername = null;
            String cPass = null;
            Cookie[] listOfCookie = request.getCookies();
            if (listOfCookie != null)
                for (Cookie c : listOfCookie) {
                    if (c.getName().equals("username")) {
                        cUsername = c.getValue();
                    } else if (c.getName().equals("password")) {
                        cPass = c.getValue();
                    }
                }
        %>
        <%
            if (cUsername == null || cPass == null) {
                out.println("<h1 style=\"color:#8b2f8a; text-align: center;\">Edusoft Web HCMIU Edu VN</h1>"
                        + "<div style=\"border-top: 10px solid #8b2f8a; padding-bottom: 15px\"></div>\n"
                        + "<div style=\"font-size: 15px; font-weight: bold;padding-left: 640px;\">\n"
                        + "<form style=\"font-size: 20px; color: #8b2f8a\" method=\"post\">\n"
                        + "    <table>\n"
                        + "        <tr>\n"
                        + "            <td>Student's ID</td>\n"
                        + "            <td><input class=\"form-control\" type=\"text\" name=\"username\" placeholder=\"ITITIU19169\" required></td>\n"
                        + "        </tr>\n"
                        + "        <tr>\n"
                        + "            <td>Password</td>\n"
                        + "            <td><input type=\"password\" name=\"password\" required></td>\n"
                        + "        </tr>\n"
                        + "        <tr>\n"
                        + "            <td><input type=\"reset\" value=\"Reset\"></td>\n"
                        + "            <td><input type=\"submit\" name=\"submit\" value=\"Login\"></td>\n"
                        + "        </tr>\n"
                        + "    </table>\n"
                        + " </form>\n"
                        + "</div>");
            } else {
                out.println("<h1 style=\"text-align: center; color: #8b2f8a\">Notice</h1>"
                        + "<p style=\"color: red;font-size: 40px;text-align: center;\">" + cUsername + " still login in this page, since you has not logout yet</p>"
                        + "<a style=\"padding-left: 1300px;\" href=\"Logout\"\n>"
                        + "<button >Logout</button>\n"
                        + "</a>");
            }
        %>

        <%
            String inputName = request.getParameter("username");
            String inputPass = request.getParameter("password");
        %>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
                if (inputName != null && inputName.trim().length() > 0) {
                    if (inputPass != null && inputPass.trim().length() > 0) {
                        try {
                            Class.forName("com.mysql.jdbc.Driver"); //step 1
                            connection = DriverManager.getConnection(connectionURL, "Admin", "admin"); //step 3
                            statement = connection.createStatement();
                            rs = statement.executeQuery("SELECT * FROM student where StudentID = \"" + inputName + "\" "); //step 5
                            if (rs.next()) {
                                out.println("Login Successful!");
                                response.addCookie(new Cookie("username", inputName));
                                response.addCookie(new Cookie("password", inputPass));
                                response.addCookie(new Cookie("_id", rs.getString("_id")));
                                response.sendRedirect(request.getContextPath() + "/homepage.jsp");
                            }
                            rs.close(); //step 7
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    } else {
                        out.println("The password is required");
                    }
                } else {
                    out.println("The username is required!");
                }
            }
        %>
    </body>
</html>
