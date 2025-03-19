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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Tracker</title>
    <style>
        /* Reset Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            line-height: 1.6;
        }

        /* Navigation Bar */
        .navbar {
            background-color: #333;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar .title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar .title a {
            text-decoration: none;
            color: white;
            transition: color 0.3s ease;
        }

        .navbar .title a:hover {
            color: #ddd;
        }

        .navbar .nav-links {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .navbar .nav-links a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .navbar .nav-links a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .navbar .nav-links .logout {
            background: #d9534f;
        }

        .navbar .nav-links .logout:hover {
            background: #c9302c;
        }

        /* Container */
        .container {
            margin: 80px auto 20px;
            padding: 2rem;
            width: 90%;
            max-width: 800px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            margin-bottom: 1rem;
            color: #333;
        }

        .container p {
            color: #666;
        }

        /* Mobile Menu Toggle */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }

        /* Media Queries */
        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 0.75rem;
            }

            .navbar .title {
                font-size: 1.25rem;
                padding: 0.5rem 0;
            }

            .menu-toggle {
                display: block;
                position: absolute;
                right: 1rem;
                top: 1rem;
            }

            .navbar .nav-links {
                display: none;
                width: 100%;
                flex-direction: column;
                padding: 0.5rem 0;
            }

            .navbar .nav-links.active {
                display: flex;
            }

            .navbar .nav-links a {
                padding: 0.75rem;
                width: 100%;
                text-align: center;
            }

            .container {
                margin: 70px auto 20px;
                padding: 1.5rem;
                width: 95%;
            }
        }

        @media screen and (max-width: 480px) {
            .navbar .title {
                font-size: 1.1rem;
            }
            .navbar .nav-links a {
                font-size: 0.9rem;
                padding: 0.6rem;
            }

            .container {
                padding: 1rem;
            }

            .container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="title">
            <a href="userhome">Application Tracker</a>
        </div>
        <button class="menu-toggle">☰</button>
        <div class="nav-links">
            <a href="userhome">Home</a>
            <a href="viewprofile">Profile</a>
            <a href="userviewjobs">Apply For Jobs</a>
            <a href="userlogout" class="logout">Logout</a>
        </div>
    </div>

    <script>
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            document.querySelector('.nav-links').classList.toggle('active');
        });
    </script>
</body>
</html>