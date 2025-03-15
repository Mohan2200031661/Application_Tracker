<%@page import="com.mb.project.model.JobLink"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Job</title>
    <jsp:include page="adminnavbar.jsp" />
    <style>
        .container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Job by ID</h2>
        <form action="updatejob" method="get">
            <input type="number" name="id" placeholder="Enter Job ID" required>
            <button type="submit">Search</button>
        </form>

        <% if (request.getAttribute("job") != null) { 
            JobLink job = (JobLink) request.getAttribute("job");
        %>
        <h2>Update Job Details</h2>
        <form action="update" method="post">
            <input type="number" name="jid" value="<%= job.getId() %>" readonly>
            <input type="text" name="comna" value="<%= job.getCompanyName() %>" required>
            <textarea name="jobdes" required><%= job.getJobDescription() %></textarea>
            <input type="url" name="applink" value="<%= job.getApplicationLink() %>" required>
            <input type="datetime-local" name="closingdt" value="<%= job.getClosingDateTime() %>" required>
            <button type="submit">Update Job</button>
        </form>
        <% } else if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>
