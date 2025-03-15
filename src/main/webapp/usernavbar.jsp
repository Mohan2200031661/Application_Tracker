<%@page import="com.mb.project.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User u = (User) session.getAttribute("u");
if (u == null) {
    response.sendRedirect("usersessionfail");
    return;
}
%>

<!-- Navigation Bar -->
<div class="navbar">
    <div class="title">
        <a href="userhome" style="color: white; text-decoration: none;">Application Tracker</a>
    </div>
    <div class="nav-links">
        <a href="userhome">Home</a>
        <a href="viewprofile">Profile</a>
        <a href="userviewjobs">Apply For Jobs</a>
        
        <a href="userlogout" style="background: #d9534f;">Logout</a>
    </div>
</div>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    /* Navigation Bar */
    .navbar {
        background-color: #333;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
    }
    
    .navbar .title {
        font-size: 20px;
        font-weight: bold;
    }
    
    .navbar .title a {
        text-decoration: none;
        color: white;
    }
    
    .navbar .nav-links a {
        color: white;
        text-decoration: none;
        margin-left: 15px;
        padding: 8px 12px;
        border-radius: 5px;
        transition: background 0.3s;
    }
    
    .navbar .nav-links a:hover {
        background: rgba(255, 255, 255, 0.2);
    }
</style>
