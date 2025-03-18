<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@include file="start.jsp" %>
<div class="container">
    <h2>User Login</h2>
    <form action="checkuserlogin" method="post">
        <label for="uid">User ID:</label>
        <input type="text" id="uid" name="uid" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" class="submit-btn">Login</button>
    </form>
</div>
</body>
</html>