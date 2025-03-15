<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Update Success</title>
<style>
/* Container Styling */
.container {
    width: 50%;
    margin: 50px auto;
    padding: 20px;
    background: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
}

/* Heading */
h3 {
    color: #28a745;
    margin-bottom: 20px;
}

/* Message Styling */
p {
    font-size: 18px;
    color: #333;
}

/* Button Styling */
.btn {
    display: inline-block;
    padding: 12px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    text-decoration: none;
}

/* Back to Profile Button */
.profile-btn {
    background: #007bff;
    color: white;
}

.profile-btn:hover {
    background: #0056b3;
}
</style>
</head>
<body>

    <jsp:include page="usernavbar.jsp" />

    <div class="container">
        <h3>Profile Updated Successfully!</h3>
        <p>${message}</p>
        <a href="viewprofile" class="btn profile-btn">Back to Profile</a>
    </div>

</body>
</html>
