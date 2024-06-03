<%@page import="java.sql.*"%>

<%
    String connectionURL = "jdbc:mysql://localhost:3306/web5"; //step 2
    Connection connection = null; //step 3
    Statement statement = null; //step 4
    ResultSet rs = null;

    Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); //step 1 com.mysql.cj.jdbc.Driver
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    
    if(connection != null) {
        out.println("<h1>Conneted</h1>");
    }
    
    String ID = request.getParameter("ID");
    
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM course WHERE courseID = "  + ID); //step 5
    while (rs.next()) {
        out.println("<p>" + rs.getString("CourseID") );
        out.println(rs.getString("CourseName") + "</p>" +"<br>");
    } //step 6
    rs.close(); //step 7
%>



