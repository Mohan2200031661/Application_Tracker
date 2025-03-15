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
    <style>
        .navbar {
            background: #007bff;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background: #0056b3;
            border-radius: 8px;
        }

        .navbar .logo {
            font-size: 20px;
            font-weight: bold;
        }

        .navbar .menu {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">
        <!-- Make the logo text clickable and link to adminhome -->
        <a href="adminhome">Admin Panel</a>
    </div>
    <div class="menu">
        <a href="adminhome">Home</a>
        <a href="addjob">Add Job</a>
        <a href="viewjobs">View Jobs</a>
        <a href="updatejob">Update Jobs</a>
        <a href="deletejob">Delete Jobs</a>
        <a href="userlogout">Logout</a>
        
    </div>
</div>

</body>
</html>
