<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement Tracker</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url('background.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            color: white;
            line-height: 1.6;
            padding-top: 70px; /* Added to prevent content from hiding under fixed navbar */
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            background-color: rgba(0, 0, 0, 0.7);
            position: fixed;
            top: 0;
            width: 100%;
            transition: all 0.3s ease;
        }

        /* Rest of your existing styles remain the same until hero-section */
        
        .navbar .logo a {
            font-size: 1.5rem;
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar .logo img {
            height: 1.5rem;
            transition: transform 0.3s ease;
        }

        .navbar .logo a:hover img {
            transform: scale(1.1);
        }

        /* Hero Section */
        .hero-section {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 10rem;
            background: rgba(0, 0, 0, 0.3);
            }

        .hero-section h1 {
        	padding-top:200px;
            font-size: clamp(2rem, 5vw, 3.5rem);
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
            color: red;
        }
        
        .
        

        .hero-section p {
            font-size: clamp(1rem, 3vw, 1.5rem);
            margin-bottom: 2rem;
            max-width: 800px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        /* Login Container */
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 600px;
            color: #333;
            margin: 1rem;
        }

        .login-container h2 {
            margin-bottom: 1.5rem;
            color: #16a085;
            text-align: center;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .login-container input {
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            width: 100%;
        }

        .login-container button {
            background-color: #16a085;
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #1abc9c;
        }

        .login-container .forgot-password {
            text-align: center;
            margin-top: 1rem;
        }

        .login-container .forgot-password a {
            color: #16a085;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .login-container .forgot-password a:hover {
            text-decoration: underline;
        }

        .hero-section .cta-buttons a {
            background-color: #16a085;
            color: white;
            font-size: clamp(1rem, 2.5vw, 1.25rem);
            padding: 0.8rem 2rem;
            text-decoration: none;
            border-radius: 25px;
            transition: all 0.3s ease;
            margin: 0.5rem;
            display: inline-block;
            font-weight: 500;
            border: 2px solid transparent;
        }

        .hero-section .cta-buttons a:hover {
            background-color: #1abc9c;
            transform: translateY(-2px);
            border-color: #fff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        .warning{
        	color: red;
        }

        /* Menu Icon */
        .menu-icon {
            display: none;
            font-size: 2rem;
            cursor: pointer;
            color: white;
            padding: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .navbar {
                padding: 1rem;
            }

            .hero-section {
                padding: 1.5rem;
            }

            .login-container {
                max-width: 350px;
            }
        }

        @media (max-width: 768px) {
            .menu-icon {
                display: block;
            }

            .navbar {
                flex-wrap: wrap;
            }

            .navbar .menu {
                display: none;
                width: 100%;
                background-color: rgba(0, 0, 0, 0.9);
                position: absolute;
                top: 100%;
                left: 0;
                padding: 1rem;
            }

            .navbar.active .menu {
                display: flex;
                flex-direction: column;
            }

            .navbar .menu a {
                margin: 0.5rem 0;
                padding: 0.8rem;
                font-size: 1.1rem;
            }

            .hero-section {
                padding-top: 5rem;
            }

            .login-container {
                padding: 1.5rem;
                max-width: 90%;
            }
        }

        @media (max-width: 480px) {
            .navbar .logo a {
                font-size: 1.2rem;
            }

            .navbar .logo img {
                height: 2rem;
            }

            .hero-section .cta-buttons {
                display: flex;
                flex-direction: column;
                width: 100%;
                max-width: 300px;
            }

            .hero-section .cta-buttons a {
                width: 100%;
            }

            .login-container {
                padding: 1rem;
                max-width: 95%;
                margin: 0.5rem;
            }

            .login-container input {
                padding: 0.6rem;
            }

            .login-container button {
                padding: 0.6rem;
            }

            .login-container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <div class="navbar">
        <div class="logo">
            <a href="/">
                <img src="images/logo.png" alt="Logo">
                Placement Tracker
            </a>
        </div>
        <div class="menu-icon" onclick="toggleMenu()">☰</div>
    </div>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Existing User Found !</h1>
        <h2>please try below ways......</h2>
        
        <div class="cta-buttons">
               <h3> Check by logging in again!</h3><a href="login?page=login">Click Here</a>
        </div>
        <div class="cta-buttons">
               <h3> Try Resetting Password </h3><a href="resetpassword">Forgot Password</a>
        </div>
        
	</div>
</body>
</html>