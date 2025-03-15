<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 350px;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        margin: 100px auto;
    }
    h2 {
        color: #d9534f;
    }
    p {
        color: #333;
    }
    a {
        display: inline-block;
        margin: 10px;
        padding: 10px 15px;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }
    .register {
        background: #0275d8;
    }
    .login {
        background: #5cb85c;
    }
    a:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Login Failed</h2>
        <p>You have entered wrong credentials.</p>
        <p>Please register or try logging in again.</p>
        <a href="userregis" class="register">Register</a>
        <a href="login" class="login">Login</a>
    </div>
</body>
</html>
