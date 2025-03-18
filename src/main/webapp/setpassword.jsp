<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Set Password</title>
</head>
<body>
    <h2>Set Your Password</h2>
    <form action="setpassword" method="post">
        <input type="hidden" name="uid" value="${uid}">
        <input type="hidden" name="uname" value="${uname}">
        <input type="hidden" name="uemail" value="${uemail}">
        <label>Password:</label>
        <input type="password" name="password" required>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
    