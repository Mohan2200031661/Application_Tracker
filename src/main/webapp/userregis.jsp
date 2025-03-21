<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
    /* Center and align buttons side by side */
.button-group {
    display: flex;
    justify-content: space-between; /* Spaces buttons evenly */
    gap: 10px; /* Adjust spacing between buttons */
    margin-top: 10px;
}

/* Optional: Make buttons the same width */
.submit-btn, .clear-btn {
    flex: 1; /* Both buttons take equal space */
    padding: 10px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    text-align: center;
}

.submit-btn {
    background-color: #007bff;
    color: white;
}

.clear-btn {
    background-color: #dc3545;
    color: white;
}

/* Responsive Adjustments */
@media (max-width: 600px) {
    .button-group {
        flex-direction: column; /* Stack buttons on smaller screens */
    }
}
    
    </style>
</head>

<body>

<jsp:include page="start.jsp">
    <jsp:param name="page" value="signup"/>
</jsp:include>

<!-- <div class="container">
    <h2>User Registration</h2>
    <form action="insertuser" method="post">
        <label for="uid">User ID:</label>
        <input type="text" id="uid" name="uid" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm-password" name="confirm-password" required>

        <div class="button-group">
            <button type="submit" class="submit-btn">Register</button>
            <button type="reset" class="clear-btn">Clear</button>
        </div>
    </form>
</div> -->

</body>
</html>