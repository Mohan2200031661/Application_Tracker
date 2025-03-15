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
<title>Update Profile</title>
<style>
/* Form Container */
.container {
	width: 50%;
	margin: 50px auto;
	padding: 20px;
	background: white;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

/* Heading */
h3 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

/* Table Styles */
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: left;
}

/* Input Fields */
input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

/* Button Styling */
.btn-container {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 20px;
}

.btn {
	padding: 12px 20px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	text-align: center;
}

/* Update Button - Green */
.submit-btn {
	background: #28a745;
	color: white;
}

.submit-btn:hover {
	background: #218838;
}

/* Cancel Button - Red */
.back-btn {
	background: #dc3545;
	color: white;
}

.back-btn:hover {
	background: #c82333;
}
</style>
</head>
<body>

	<jsp:include page="usernavbar.jsp" />

	<div class="container">
		<h3>Update Profile</h3>
		<form action="updateuserprofile" method="post">

			<label>User ID:</label> <br />
			<input type="text" name="uid" value="${user.id}" readonly> <br /><br /> 

			<label>Email:</label> 
			<input type="text" name="email" value="${user.email}" readonly><br /><br /> 

			<label>Name:</label> 
			<input type="text" name="uname" value="${user.name}" required><br /><br /> 

			<label>Password:</label> 
			<input type="password" name="password"  value="${user.password }"required><br /><br />

			<div class="btn-container">
				<button type="submit" class="btn submit-btn">Update Profile</button>
				<a href="viewprofile" class="btn back-btn">Cancel</a>
			</div>

		</form>
	</div>

</body>
</html>
