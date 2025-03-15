<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Expired</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #ececec);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #dc3545;
            font-size: 24px;
        }

        .login-btn {
            background: #007bff;
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .login-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>Session Expired</h3>
    <p>Your session has expired due to inactivity. Please log in again.</p>
    <a href="login" class="login-btn">Login Again</a>
</div>

</body>
</html>
