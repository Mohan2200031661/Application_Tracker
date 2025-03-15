<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Success Page</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    text-align: center;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #28a745;
}

a {
    display: inline-block;
    text-decoration: none;
    color: white;
    background: #007bff;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 20px;
    transition: 0.3s;
}

a:hover {
    background: #0056b3;
}
</style>
</head> 
<body>

<jsp:include page="adminnavbar.jsp" />

<div class="container">
    <h2>Job Successfully Added!</h2>
    <p>The job has been successfully added to the system.</p>
    <a href="viewjobs">View Jobs</a>
</div>

</body>
</html>
