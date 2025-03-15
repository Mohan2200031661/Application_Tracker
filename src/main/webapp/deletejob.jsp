<%@page import="com.mb.project.model.JobLink"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%
List<JobLink> jl = (List<JobLink>) request.getAttribute("jl");
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Job Applications</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	text-align: center;
	background: #f8f9fa;
}

.container {
	max-width: 1700px;
	margin: 20px auto;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

input[type="text"] {
	width: 80%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #343a40;
	color: white;
}

a {
	text-decoration: none;
	color: white;
	padding: 5px 10px;
	background: #007bff;
	border-radius: 5px;
	display: inline-block;
}

a:hover {
	background: #0056b3;
}

/* Red Delete Button */
.delete-btn {
	background: #dc3545;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	display: inline-block;
	cursor: pointer;
	border: none;
}

.delete-btn:hover {
	background: #c82333;
}

/* Modal Styles */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
	border-radius: 8px;
	text-align: center;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.modal button {
	margin: 10px;
	padding: 8px 15px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.confirm-delete {
	background-color: #dc3545;
	color: white;
}

.cancel-delete {
	background-color: #6c757d;
	color: white;
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

	// Function to Show Delete Confirmation Modal
	function confirmDelete(jobId, companyName) {
		document.getElementById("deleteJobId").innerText = jobId;
		document.getElementById("deleteCompanyName").innerText = companyName;
		document.getElementById("confirmDeleteBtn").setAttribute("href",
				"delete?id=" + jobId);
		document.getElementById("deleteModal").style.display = "block";
	}

	// Function to Close the Modal
	function closeModal() {
		document.getElementById("deleteModal").style.display = "none";
	}
</script>
</head>
<body>
	<jsp:include page="adminnavbar.jsp" />
	<br />
	<div class="container">
		<h2>Delete Job Application</h2>
		<input type="text" id="searchBox" onkeyup="searchJobs()"
			placeholder="Search by Company Name or Job ID...">

		<h3 align="center">
			<span class="count-box">Total Count: ${count}</span>
		</h3>

		<table id="jobTable">
			<thead>
				<tr>
					<th>Job ID</th>
					<th>Company Name</th>
					<th>Job Description</th>
					<th>Application Link</th>
					<th>Closing Date</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (jl != null && !jl.isEmpty()) {
					for (JobLink job : jl) {
				%>
				<tr>
					<td><%=job.getId()%></td>
					<td><%=job.getCompanyName()%></td>
					<td><%=job.getJobDescription()%></td>
					<td><a href="<%=job.getApplicationLink()%>" target="_blank">Apply</a></td>
					<td><%=job.getClosingDateTime().format(formatter)%></td>
					<td><%=job.getStatus()%></td>
					<td><button class="delete-btn"
							onclick="confirmDelete('<%=job.getId()%>', '<%=job.getCompanyName()%>')">Delete</button></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7">No job listings available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<br> <a href="addjob.jsp">Add New Job</a>
	</div>

	<!-- Delete Confirmation Modal -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<h3>Confirm Delete</h3>
			<p>
				Are you sure you want to delete <strong>Job ID: <span
					id="deleteJobId"></span></strong> from <strong><span
					id="deleteCompanyName"></span></strong>?
			</p>
			<a id="confirmDeleteBtn" class="confirm-delete" href="#">Yes,
				Delete</a>
			<button class="cancel-delete" onclick="closeModal()">Cancel</button>
		</div>
	</div>
</body>
</html>
