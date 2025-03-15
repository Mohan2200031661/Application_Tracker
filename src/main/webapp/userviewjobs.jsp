<%@page import="com.mb.project.model.JobLink"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<JobLink> jl = (List<JobLink>) request.getAttribute("jl");
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Job Applications</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	text-align: center;
	background: #eef2f7;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1000px;
	margin: 40px auto;
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
}

h2 {
	color: #333;
	margin-bottom: 15px;
}

input[type="text"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 16px;
	box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.05);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
	font-size: 14px;
}

th {
	background-color: #007bff;
	color: white;
	text-transform: uppercase;
}

td {
	color: #555;
	background: #fff;
}

tr:nth-child(even) {
	background: #f8f9fa;
}

tr:hover {
	background: #e2e6ea;
}

/* a {
	text-decoration: none;
	color: white;
	padding: 6px 12px;
	background: darkgrey;
	border-radius: 5px;
	display: inline-block;
	transition: 0.3s ease-in-out;
}

a:hover {
	background: darkgrey;
} */

.count-box {
	display: inline-block;
	background: #007bff;
	color: white;
	padding: 8px 16px;
	border-radius: 6px;
	font-weight: bold;
	font-size: 16px;
	margin-top: 10px;
}

</style>
<script>
	function searchJobs() {
		let input = document.getElementById("searchBox").value.toLowerCase();
		let table = document.getElementById("jobTable");
		let rows = table.getElementsByTagName("tr");

		for (let i = 1; i < table.rows.length; i++) {
			let companyName = table.rows[i].cells[1].innerText.toLowerCase();
			let jobId = table.rows[i].cells[0].innerText.toLowerCase();

			if (companyName.includes(input) || jobId.includes(input)) {
				table.rows[i].style.display = "";
			} else {
				table.rows[i].style.display = "none";
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="usernavbar.jsp" />
	<div class="container">
		<h2>Job Listings</h2>
		<input type="text" id="searchBox" onkeyup="searchJobs()"
			placeholder="Search by Company Name or Job ID...">

		<h3 align="center">
			<span >Total Count: ${count}</span>
		</h3>
		<table id="jobTable">
			<thead>
				<tr>
					<!-- <th>Job ID</th> -->
					<th>Company Name</th>
					<th>Job Description</th>
					<th>Application Link</th>
					<th>Closing Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (jl != null && !jl.isEmpty()) {
					for (JobLink job : jl) {
				%>
				<tr>
					<%-- <td><%=job.getId()%></td> --%>
					<td><%=job.getCompanyName()%></td>
					<td><%=job.getJobDescription()%></td>
					<td><a href="<%=job.getApplicationLink()%>" target="_blank">Apply</a></td>
					<td><%=job.getClosingDateTime().format(formatter)%></td>
					<td><%=job.getStatus()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6">No job listings available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		
	</div>
</body>
</html>
