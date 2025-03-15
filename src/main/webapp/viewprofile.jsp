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

/* Button Container for Side-by-Side Buttons */
.btn-container {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 20px;
}

/* Common Button Styles */
.btn {
	padding: 12px 20px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

/* Back to Home - Blue */
.back-btn {
	background: #007bff;
	color: white;
}

.back-btn:hover {
	background: #0056b3;
}

/* Update Profile - Green */
.update-btn {
	background: #28a745;
	color: white;
}

.update-btn:hover {
	background: #218838;
}
</style>
</head>
<body>


	<jsp:include page="usernavbar.jsp" />

	<div class="container">
		<h3>User Profile</h3>
		<table>
			<tr>
				<th>ID</th>
				<td><%=u.getId()%></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><%=u.getName()%></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=u.getEmail()%></td>
			</tr>
			<tr>
				<th>User Type</th>
				<td><%=u.getUserType()%></td>
			</tr>
		</table>

		<div class="btn-container">
			 <a href="updateprofile" class="btn update-btn">Update Profile</a>
			 <a href="userhome" class="btn back-btn">Back to Home</a>
		</div>

	</div>

</body>
</html>
