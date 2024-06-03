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
        <title>Part 3 - Exercise 1</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h1 style="margin-bottom: -10px;">Collect Three Parameters</h1>
                <h4>Part 3 - Exercise 1</h4>
            </div>
            <div class="content">
                <div class="header-table">
                </div>
                <div class="content-table">
                    <form action="GetThreeParams" method="POST">
                        <table>
                            <tr>
                                <th>First Parameter</th>
                                <td>
                                    <input type="text" name="1st" required />
                                </td>
                            </tr>
                            <tr>
                                <th>Second Parameter</th>

                                <td>
                                    <input type="text" name="2nd" required />
                                </td>
                            </tr>
                            <tr>
                                <th>Tnird Parameter</th>

                                <td>
                                    <input type="text" name="3rd" required />
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input type="submit" value="Submit"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
