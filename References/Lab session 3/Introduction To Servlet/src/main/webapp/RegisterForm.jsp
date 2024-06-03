<%-- 
    Document   : RegisterForm
    Created on : Mar 23, 2022, 6:22:39 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Form</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h1>School of Computer Science & Engineering</h1>
            </div>
            <div class="line" style="border-top: 3px solid red;"></div>
            <div class="content">
                <div class="header-table">
                    <h2>Register form</h2>
                </div>
                <div class="content-table">
                    <form action="RegisterCourse" method="post">
                        <table>
                            <tr>
                                <th>Full name</th>
                                <td>
                                    <input type="text" name="fullname" required />
                                </td>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <td>
                                    <input type="text" name="id" required />
                                </td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>
                                    <input type="text" name="email" required />
                                </td>
                            </tr>
                            <tr>
                                <th>Gender</th>
                                <td>
                                    <input type="radio" name="gender" value="Male" />Male
                                    <input type="radio" name="gender" value="Female" />Female
                                </td>
                            </tr>
                            <tr>
                                <th>Field of study</th>
                                <td>
                                    <select name="major">
                                        <option>CS</option>
                                        <option>IM</option>
                                        <option>EE</option>
                                        <option>BA</option>
                                        <option>BE</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>List of subjects</th>
                                <td>
                                    <input type="checkbox" name="subject" value="Principle of EE1">Principle of EE1
                                    <br>
                                    <input type="checkbox" name="subject" value="Computer Network">Computer Network
                                    <br>
                                    <input type="checkbox" name="subject" value="Web Application Development">Web Application Development
                                    <br>
                                    <input type="checkbox" name="subject" value="Object-Oriented Programming">Object-Oriented Programming
                                    <br>
                                    <input type="checkbox" name="subject" value="Computer Graphic">Computer Graphic
                                </td>
                            </tr>
                            <tr>
                                <th>Comment</th>
                                <td>
                                    <textarea rows="4" cols="50" name="comment"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <input type="submit" name="submit" value="Submit" />
                                </th>
                                <td>
                                    <input type="reset" name="submit" value="Reset" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
