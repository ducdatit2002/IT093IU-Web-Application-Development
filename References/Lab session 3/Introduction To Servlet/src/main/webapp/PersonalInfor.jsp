<%-- 
    Document   : PersonalInfor
    Created on : Mar 23, 2022, 5:08:28 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Personal Information</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="container">

            <div class="header">
                <h1 style="text-align: center;">Personal Information</h1>
            </div>

            <div class="line"></div>

            <div class="content">
                <div class="header-table">
                </div>

                <div class="content-table">
                    <form action="GetInfo" method="post">
                        <table>
                            <tr>
                                <th>ID</th>
                                <td>
                                    <input type="text" name="id" required />
                                </td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td>
                                    <input type="text" name="fullname" required />
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
                                <th>Major</th>
                                <td>
                                    <select name="major">
                                        <option>Business Administration</option>
                                        <option>Computer Science</option>
                                        <option>Biotechnology</option>
                                        <option>Data Science</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Interesting Field</th>
                                <td>
                                    <textarea rows="4" cols="50" name="comment"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <input type="submit" name="submit" value="Insert" />
                                </th>
                                <td>
                                    <input type="reset" name="submit" value="Cancel" />
                                </td>
                            </tr>
                        </table>

                    </form>
                </div>
            </div>
        </div>
    </body>

</html>