<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
    </head>
    <body>
        <h2>Login Form</h2>
        <form method="post" action="login.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" name="Login" value="Login">
        </form>
        <%
            if (request.getParameter("Login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                String dbuser = "root";
                String dbpassword = "root";
                Connection con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

                PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    out.print("Connect sucess!");
                    String name = rs.getString("username");
                    String pass = rs.getString("password");
                    
                    User u = new User(name, pass);
                    request.setAttribute("user1", u);
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);

                } else {
                    // Invalid credentials, show error message
                    out.print("Invalid username or password.");
                }
            }
        %>
    </body>
</html>

