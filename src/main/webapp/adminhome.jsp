<%@page import="com.mb.project.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
User u = (User) session.getAttribute("u");
if (u == null) {
    response.sendRedirect("usersessionfail");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #ececec);
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
        }
        
        h2 {
            color: #333;
        }
        
        .logout-btn {
            background: #dc3545;
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .logout-btn:hover {
            background: #b02a37;
        }
    </style>
</head>
<body>
<jsp:include page="adminnavbar.jsp" />
<div class="container">
    <h2>Welcome, Admin!</h2>
    <p>You are successfully logged in as an administrator.</p>
    <a href="userlogout" class="logout-btn">Logout</a>
</div>

</body>
</html>
