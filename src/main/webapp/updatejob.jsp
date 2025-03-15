<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Add Job Application</title>
    <!-- Include external stylesheet for the navbar -->
    <jsp:include page="adminnavbar.jsp" />
    <style>
        /* Global styles */
       /*  body {
            font-family: 'Poppins', sans-serif;
            background: #f4f6f9;
            margin: auto;
            padding: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        } */

        h2 {
            color: #343a40;
            margin-bottom: 20px;
        }

        .container {
            background: white;
            width: 100%;
            max-width: 500px;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="url"], input[type="datetime-local"] {
            background: #f8f9fa;
        }

        button {
            background: #007bff;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background: #0056b3;
        }

       
    </style>
</head>
<body>

    <div class="container">
        <h2 class="form-title">Add Job Application</h2>
        <form action="insertjoblink" method="post">
            <input type="text" name="comna" placeholder="Company Name"   required>
            <textarea name="jobdes" placeholder="Job Description" required></textarea>
            <input type="url" name="applink" placeholder="Application Link" required>
            <input type="datetime-local" name="closingdt" required>
            <button type="submit">Add Job</button>
        </form>
    </div>

</body>
</html>
