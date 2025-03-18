<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Email Sent</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
        }
        .message {
            font-size: 18px;
            color: #333;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .warning {
            font-size: 16px;
            color: red;
            margin-top: 10px;
        }
        .home-link {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .home-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Email Sent Successfully!</h2>
        <p class="message">A verification email has been sent to your registered email address.</p>
        <p class="success">${message}</p>
        <p>Please check your inbox and click on the provided link to set your password.</p>
        
        <!-- New Caption Added -->
        <p class="warning">Haven't received the email? Check your <b>Quarantine Mail</b> from <a href="https://security.microsoft.com/quarantine" target="_blank">here</a>.</p>

        <a href="login.jsp" class="home-link">Go to Login</a>
    </div>

</body>
</html>
