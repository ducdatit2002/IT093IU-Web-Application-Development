<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join our email list</title>
    <!-- Include CSS file for styling -->
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="form-container">
    <h1>Join our email list</h1>
    <p>To join our email list, enter your name and email address below.</p>
    <form action="EmailServlet" method="post">
        <div class="form-field">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-field">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>
        </div>
        <div class="form-field">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
        </div>
        <div class="form-field">
            <input type="submit" value="Join Now">
        </div>
    </form>
</div>

</body>
</html>

