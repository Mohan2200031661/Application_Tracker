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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home - Application Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        .header h1 {
            font-size: 2.5rem;
            margin: 0;
        }
        .user-info {
            text-align: center;
            margin-top: 30px;
            font-size: 1.5rem;
            color: #2c3e50;
        }
        .user-info p {
            font-size: 1.2rem;
            color: #34495e;
        }
        .job-updates {
            background-color: #ecf0f1;
            margin: 30px auto;
            padding: 20px;
            max-width: 800px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .job-updates h2 {
            color: #16a085;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }
        .job-list {
            list-style-type: none;
            padding: 0;
        }
        .job-list li {
            background-color: #fff;
            margin: 10px 0;
            padding: 10px;
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .job-list li a {
            text-decoration: none;
            color: #2c3e50;
            font-size: 1.1rem;
            font-weight: bold;
        }
        .job-list li a:hover {
            color: #16a085;
        }
        .btn-apply {
            padding: 10px 20px;
            background-color: #16a085;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .btn-apply:hover {
            background-color: #1abc9c;
        }
    </style>
</head>
<body>

    <!-- Include Navigation Bar -->
    <jsp:include page="usernavbar.jsp" />
    
    <!-- Header Section -->
    <div class="header">
        <h1>Welcome to the Application Tracker</h1>
        <p>Your one-stop solution for tracking job opportunities and applying directly!</p>
    </div>

    <!-- User Information Section -->
    <div class="user-info">
        <p>Welcome back, <%= u.getName() %>!</p>
        <p>Explore the latest job updates and apply for your next opportunity.</p>
    </div>

    <!-- Job Updates Section -->
    <!-- <div class="job-updates">
        <h2>Latest Job Updates</h2>
        <ul class="job-list">
            <li>
                <a href="#">Software Engineer - ABC Corp</a>
                <p>Location: New York | Deadline: 30th March 2025</p>
                <a href="#" class="btn-apply">Apply Now</a>
            </li>
            <li>
                <a href="#">Data Analyst - XYZ Ltd</a>
                <p>Location: San Francisco | Deadline: 15th April 2025</p>
                <a href="#" class="btn-apply">Apply Now</a>
            </li>
            <li>
                <a href="#">Frontend Developer - TechSolutions</a>
                <p>Location: Remote | Deadline: 10th April 2025</p>
                <a href="#" class="btn-apply">Apply Now</a>
            </li>
        </ul>
    </div>
 -->
</body>
</html>
