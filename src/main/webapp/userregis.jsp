<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@include file="start.jsp" %>
<div class="container">
    <h2>User Registration</h2>
    <form action="insertuser" method="post">
        <label for="uid">User ID:</label>
        <input type="text" id="uid" name="uid" required>
        
        <label for="uname">Name:</label>
        <input type="text" id="uname" name="uname" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit" class="submit-btn">Submit</button>
        <button type="reset" class="clear-btn">Clear</button>
    </form>
</div>
</body>
</html>