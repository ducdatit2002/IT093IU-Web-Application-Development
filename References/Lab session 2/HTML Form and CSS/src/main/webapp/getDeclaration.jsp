<%-- 
    Document   : getDeclaration
    Created on : Mar 16, 2022, 5:18:20 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Declaration Result</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="alert alert-info" role="alert" style="text-align: center">
                <% String name = request.getParameter("txt");%>
                <h4 class="alert-heading"> <%=name%>'s DECLARATION</h4>
            </div>
            <h2 style="text-align: center">Result Table</h2>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">Student's name</th>
                        <th scope="col">Student's id</th>
                        <th scope="col">Student's email</th>
                        <th scope="col">Student's gender</th>
                        <th scope="col">Student's major</th>
                        <th scope="col">Student's positive with Covid-19</th>
                        <th scope="col">Student's dose</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <%
                                out.print(name);
                            %>
                        </td>
                        <td>
                            <%
                                String id = request.getParameter("id");
                                out.print(id);
                            %>
                        </td>
                        <td>
                            <%
                                String email = request.getParameter("email");
                                out.print(email);
                            %>
                        </td>
                        <td>
                            <%
                                String gender = request.getParameter("gender");
                                out.print(gender);
                            %>
                        </td>
                        <td>
                            <%
                                String major = request.getParameter("major");
                                out.print(major);
                            %>
                        </td>
                        <td>
                            <%
                                String contact = request.getParameter("contact");
                                out.print(contact);
                            %>
                        </td>
                        <td>
                            <%
                                String dose = request.getParameter("dose");
                                out.print(dose);
                            %>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div class="alert alert-danger" role="alert" style="text-align: center">
                <h4 class="alert-heading">
                    <%
                        String check = request.getParameter("check");
                        out.print("Student's confirmation the information: " + check);
                    %>
                </h4>
            </div>
        </div>
    </body>
</html>
