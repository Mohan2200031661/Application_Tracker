<!DOCTYPE html>
<html>
<head>
    <title>User Form</title>
    <style>
         body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(to right, #f8f9fa, #ececec);
    font-family: 'Poppins', sans-serif;
}

.container {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    width: 350px;
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

label {
    width: 100%;
    text-align: left;
    font-size: 14px;
    color: #555;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 14px;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
}

.submit-btn {
    background: #007bff;
    color: white;
    font-weight: bold;
    transition: 0.3s;
}

.submit-btn:hover {
    background: #0056b3;
}

.clear-btn {
    background: #dc3545;
    color: white;
    font-weight: bold;
    transition: 0.3s;
}

.clear-btn:hover {
    background: #b02a37;
}

    </style>
</head>
<body>
<div class="container">
    <h2>User Registration</h2>
    <form action="insertuser" method="post">
        <label for="uid">User ID:</label>
        <input type="text" id="uid" name="uid" required>
        
        <label for="uname">Name:</label>
        <input type="text" id="uname" name="uname" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        
        
        <input type="submit" value="Submit">
        <input type="reset" value="Clear">
    </form>
    </div>
</body>
</html>
