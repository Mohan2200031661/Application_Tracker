<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Job Application</title>
    <!-- Include external stylesheet for the navbar -->
    <jsp:include page="adminnavbar.jsp" />
    <style>
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

        .error-message {
            color: red;
            font-size: 14px;
            display: none;
            margin-top: -8px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="form-title">Add Job Application</h2>
        <form id="jobForm" action="insertjoblink" method="post">
            <input type="text" name="comna" placeholder="Company Name" required>
            <textarea name="jobdes" placeholder="Job Description" required></textarea>
            <input type="url" name="applink" placeholder="Application Link" required>
            <input type="datetime-local" name="closingdt" id="closingdt" required>
            <p class="error-message" id="dateError">Closing date must be in the future.</p>
            <button type="submit">Add Job</button>
        </form>
    </div>

    <script>
        function setMinDateTime() {
            let now = new Date();
            now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); // Adjust for timezone
            document.getElementById("closingdt").min = now.toISOString().slice(0, 16);
        }

        function validateDate(event) {
            let closingDate = new Date(document.getElementById("closingdt").value);
            let currentDate = new Date();
            
            if (closingDate <= currentDate) {
                document.getElementById("dateError").style.display = "block";
                event.preventDefault(); // Prevent form submission
            } else {
                document.getElementById("dateError").style.display = "none";
            }
        }

        document.addEventListener("DOMContentLoaded", setMinDateTime);
        document.getElementById("jobForm").addEventListener("submit", validateDate);
    </script>

</body>
</html>
 