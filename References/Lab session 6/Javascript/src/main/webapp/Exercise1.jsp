<%-- 
    Document   : Exercise1
    Created on : May 2, 2022, 7:35:22 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input page</title>

        <script type="text/javascript">

            function storeCookies() {
                cookievalue = escape(document.forms["inputForm"]["fullname"].value) + ";";
                document.cookie = "fullname=" + cookievalue;
                cookievalue1 = escape(document.forms["inputForm"]["email"].value) + ";";
                document.cookie = "email=" + cookievalue1;
                cookievalue2 = escape(document.forms["inputForm"]["username"].value) + ";";
                document.cookie = "username=" + cookievalue2;
                cookievalue3 = escape(document.forms["inputForm"]["password"].value) + ";";
                document.cookie = "password=" + cookievalue3;
            }

            function required()
            {
                var checkFname = document.forms["inputForm"]["fullname"].value;
                var checkEmail = document.forms["inputForm"]["email"].value;
                var checkUsername = document.forms["inputForm"]["username"].value;
                var checkPass = document.forms["inputForm"]["password"].value;
                var CheckPassConf = document.forms["inputForm"]["passwordConf"].value;
                if (checkFname == "")
                {
                    alert("Please fill in your full name ");
                    return false;
                } else if (checkUsername == "")
                {
                    alert("Please fill in your user name ");
                    return false;
                } else if (checkPass == "")
                {
                    alert("Please fill in your password ");
                    return false;
                } else if (checkPass != CheckPassConf)
                {
                    alert("Your confirm password is not correct");
                    return false;
                } else if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(checkEmail))
                {
                    return (true)
                } else {
                    alert("Your email address must be valid")
                    return (false)
                }
            }
        </script>
    </head>
    <body>
        <h1>Register to become a member of the website</h1>
        <form name="inputForm" action="RecordInfo.jsp" method="post" onsubmit="return required();">
            <table>
                <tr>
                    <td>Full name:</td>
                    <td>
                        <input type="text" name="fullname">
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <input type="text" name="email">
                    </td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td>
                        <input type="text" name="username">
                    </td>
                </tr>
                <tr>
                    <td>Choose a password:</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td>Re-enter password:</td>
                    <td>
                        <input type="password" name="passwordConf">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit" onClick="storeCookies()">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href='index.html'>Return to homepage</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
