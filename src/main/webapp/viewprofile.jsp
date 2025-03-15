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
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
    .container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    
    h3 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background: #333;
        color: white;
    }
    
    tr:hover {
        background-color: #f1f1f1;
    }
    
    .back-btn {
        display: block;
        width: fit-content;
        margin: 20px auto;
        padding: 10px 20px;
        background: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
    }
    
    .back-btn:hover {
        background: #0056b3;
    }
</style>
</head>
<body>

   
    <jsp:include page="usernavbar.jsp" />

    <div class="container">
        <h3>Employee Profile</h3>
        <table>
            <tr>
                <th>ID</th>
                <td><%= u.getId() %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= u.getName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= u.getEmail() %></td>
            </tr>
            <tr>
                <th>User Type</th>
                <td><%= u.getUserType() %></td>
            </tr>
        </table>
        <a href="userhome" class="back-btn">Back to Home</a>
    </div>

</body>
</html>
