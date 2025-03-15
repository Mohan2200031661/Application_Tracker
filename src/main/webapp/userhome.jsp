
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
<title>User Home</title>
</head>
<body>

    
    <jsp:include page="usernavbar.jsp" />
    <!-- User Information Section -->
    <div style="text-align: center; margin-top: 50px;">
        <p style="font-size: 24px; font-weight: bold; color: #333;">
            Welcome, <%= u.getName() %>!
        </p>
    </div>

</body>
</html>
  