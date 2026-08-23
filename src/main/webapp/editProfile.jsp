<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Profile - FoodLounge</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background-color: #f6f6f6;
            color: #2f2f2f;
        }

        .navbar {
            width: 100%;
            height: 74px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            background-color: white;
            border-bottom: 1px solid #e9e9e9;
        }

        .logo {
            color: #ff5a1f;
            text-decoration: none;
            font-size: 29px;
            font-weight: bold;
        }

        .logo span {
            color: #252525;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .nav-links a {
            color: #555;
            text-decoration: none;
            font-size: 15px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #ff5a1f;
        }

        .profile-nav {
            padding: 10px 17px;
            border-radius: 7px;
            background-color: #fff1eb;
            color: #e94c15 !important;
        }

        .main-container {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
            padding: 55px 20px 70px;
        }

        .page-heading {
            margin-bottom: 28px;
        }

        .page-heading h1 {
            margin-bottom: 8px;
            color: #252525;
            font-size: 31px;
        }

        .page-heading p {
            color: #777;
            font-size: 15px;
        }

        .edit-card {
            background-color: white;
            border: 1px solid #ebebeb;
            border-radius: 13px;
            padding: 32px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 7px;
            font-size: 15px;
            outline: none;
        }

        .form-group input:focus {
            border-color: #ff5a1f;
        }

        .button-container {
            display: flex;
            gap: 12px;
            margin-top: 28px;
        }

        .update-button {
            padding: 12px 22px;
            border: none;
            border-radius: 7px;
            background-color: #ff5a1f;
            color: white;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-button:hover {
            background-color: #e94c15;
        }

        .cancel-button {
            padding: 12px 22px;
            border: 1px solid #ddd;
            border-radius: 7px;
            background-color: white;
            color: #555;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .cancel-button:hover {
            background-color: #f5f5f5;
        }

    </style>

</head>

<body>

    <header class="navbar">

        <a href="restaurant" class="logo">
            Food<span>Lounge</span>
        </a>

        <nav class="nav-links">

            <a href="restaurant">
                Restaurants
            </a>

            <a href="profile" class="profile-nav">
                My Account
            </a>

        </nav>

    </header>


    <main class="main-container">

        <div class="page-heading">

            <h1>
                Edit Profile
            </h1>

            <p>
                Update your personal information
            </p>

        </div>


        <section class="edit-card">

            <form action="updateProfile" method="post">

                <div class="form-group">

                    <label>
                        Full Name
                    </label>

                    <input type="text"
                           name="userName"
                           value="<%= user.getUserName() %>"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Email Address
                    </label>

                    <input type="email"
                           name="email"
                           value="<%= user.getEmail() %>"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <input type="text"
                           name="address"
                           value="<%= user.getAddress() %>"
                           required>

                </div>


                <div class="button-container">

                    <button type="submit"
                            class="update-button">
                        Update Profile
                    </button>

                    <a href="profile"
                       class="cancel-button">
                        Cancel
                    </a>

                </div>

            </form>

        </section>

    </main>

</body>

</html>