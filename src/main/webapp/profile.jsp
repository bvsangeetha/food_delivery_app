<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }

    String userName = user.getUserName();

    String firstLetter = "U";

    if (userName != null && !userName.trim().isEmpty()) {
        firstLetter = userName.substring(0, 1).toUpperCase();
    }
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Account - FoodLounge</title>

    <style>

        /* =================================
           BASIC RESET
        ================================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }


        /* =================================
           BODY
        ================================= */

        body {
            min-height: 100vh;
            background-color: #f6f6f6;
            color: #2f2f2f;
        }


        /* =================================
           TOP NAVIGATION
        ================================= */

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


        /* =================================
           LOGO
        ================================= */

        .logo {
            color: #ff5a1f;

            text-decoration: none;

            font-size: 29px;
            font-weight: bold;
        }


        .logo span {
            color: #252525;
        }


        /* =================================
           NAVIGATION LINKS
        ================================= */

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

            transition: 0.3s;
        }


        .nav-links a:hover {
            color: #ff5a1f;
        }


        .nav-links .active {
            color: #ff5a1f;
        }


        /* =================================
           PROFILE NAVIGATION BUTTON
        ================================= */

        .profile-nav {
            padding: 10px 17px;

            border-radius: 7px;

            background-color: #fff1eb;

            color: #e94c15 !important;
        }


        .profile-nav:hover {
            background-color: #ffe4d8;
        }


        /* =================================
           MAIN CONTENT
        ================================= */

        .main-container {
            width: 100%;
            max-width: 950px;

            margin: 0 auto;

            padding: 55px 20px 70px;
        }


        /* =================================
           PAGE HEADING
        ================================= */

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


        /* =================================
           MAIN PROFILE CARD
        ================================= */

        .profile-card {
            overflow: hidden;

            background-color: white;

            border: 1px solid #ebebeb;

            border-radius: 13px;

            box-shadow:
                0 5px 18px
                rgba(0, 0, 0, 0.05);
        }


        /* =================================
           USER HEADER
        ================================= */

        .user-header {
            padding: 28px 32px;

            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;

            border-bottom: 1px solid #eeeeee;
        }


        .user-details {
            display: flex;
            align-items: center;
            gap: 18px;
        }


        /* =================================
           USER AVATAR
        ================================= */

        .avatar {
            width: 65px;
            height: 65px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 50%;

            background-color: #ff5a1f;

            color: white;

            font-size: 25px;
            font-weight: bold;
        }


        .user-name {
            margin-bottom: 6px;

            color: #292929;

            font-size: 21px;
        }


        .user-email {
            color: #777;

            font-size: 14px;
        }


        /* =================================
           EDIT PROFILE BUTTON
        ================================= */

        .edit-button {
            padding: 11px 19px;

            display: inline-block;

            border: 1px solid #ff5a1f;

            border-radius: 7px;

            background-color: white;

            color: #ff5a1f;

            text-decoration: none;

            font-size: 14px;
            font-weight: bold;

            transition: 0.3s;
        }


        .edit-button:hover {
            background-color: #ff5a1f;

            color: white;
        }


        /* =================================
           PERSONAL INFORMATION
        ================================= */

        .information-section {
            padding: 30px 32px;
        }


        .section-title {
            margin-bottom: 25px;

            color: #292929;

            font-size: 20px;
        }


        /* =================================
           INFORMATION ROW
        ================================= */

        .information-row {
            padding: 19px 0;

            display: grid;

            grid-template-columns: 210px 1fr;

            border-bottom: 1px solid #eeeeee;
        }


        .information-row:first-of-type {
            border-top: 1px solid #eeeeee;
        }


        .information-row:last-child {
            border-bottom: none;
        }


        .information-label {
            color: #777;

            font-size: 14px;
            font-weight: 600;
        }


        .information-value {
            color: #303030;

            font-size: 15px;

            line-height: 1.5;

            word-break: break-word;
        }


        /* =================================
           ACCOUNT OPTIONS
        ================================= */

        .account-options {
            margin-top: 28px;

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 18px;
        }


        /* =================================
           OPTION CARD
        ================================= */

        .option-card {
            padding: 24px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            background-color: white;

            border: 1px solid #e9e9e9;

            border-radius: 12px;

            text-decoration: none;

            transition: 0.3s;
        }


        .option-card:hover {
            border-color: #ffb89d;

            transform:
                translateY(-2px);

            box-shadow:
                0 7px 18px
                rgba(0, 0, 0, 0.06);
        }


        .option-content {
            display: flex;
            align-items: center;
            gap: 16px;
        }


        /* =================================
           SIMPLE ICON BOX
        ================================= */

        .option-icon {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 9px;

            background-color: #fff1eb;

            color: #ff5a1f;

            font-size: 21px;
            font-weight: bold;
        }


        .option-text h3 {
            margin-bottom: 6px;

            color: #303030;

            font-size: 17px;
        }


        .option-text p {
            color: #808080;

            font-size: 13px;
        }


        .option-arrow {
            color: #ff5a1f;

            font-size: 24px;
        }


        /* =================================
           MOBILE RESPONSIVE
        ================================= */

        @media (max-width: 700px) {

            .navbar {
                height: auto;

                padding: 18px 5%;

                flex-direction: column;

                gap: 17px;
            }


            .nav-links {
                width: 100%;

                justify-content: center;

                gap: 17px;
            }


            .nav-links a {
                font-size: 13px;
            }


            .main-container {
                padding-top: 35px;
            }


            .page-heading h1 {
                font-size: 27px;
            }


            .user-header {
                padding: 24px;

                align-items: flex-start;

                flex-direction: column;
            }


            .edit-button {
                width: 100%;

                text-align: center;
            }


            .information-section {
                padding: 25px 24px;
            }


            .information-row {
                grid-template-columns: 1fr;

                gap: 8px;
            }


            .account-options {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 420px) {

            .nav-links {
                gap: 10px;
            }


            .profile-nav {
                padding: 8px 11px;
            }


            .user-details {
                align-items: flex-start;
            }


            .avatar {
                width: 55px;
                height: 55px;

                font-size: 21px;
            }


            .user-name {
                font-size: 18px;
            }

        }

    </style>

</head>


<body>


    <!-- =================================
         TOP NAVIGATION BAR
    ================================= -->

    <header class="navbar">


        <!-- FOODLOUNGE LOGO -->

        <a href="restaurant"
           class="logo">

            Food<span>Lounge</span>

        </a>



        <!-- NAVIGATION -->

        <nav class="nav-links">


            <a href="restaurant">

                Restaurants

            </a>


            <a href="profile"
               class="profile-nav active">

                My Account

            </a>


        </nav>


    </header>



    <!-- =================================
         MAIN PROFILE CONTENT
    ================================= -->

    <main class="main-container">


        <!-- PAGE TITLE -->

        <div class="page-heading">


            <h1>

                My Account

            </h1>


            <p>

                Manage your profile and delivery preferences

            </p>


        </div>



        <!-- =================================
             PROFILE INFORMATION CARD
        ================================= -->

        <section class="profile-card">


            <!-- USER DETAILS -->

            <div class="user-header">


                <div class="user-details">


                    <!-- USER AVATAR -->

                    <div class="avatar">

                        <%= firstLetter %>

                    </div>



                    <!-- USER NAME AND EMAIL -->

                    <div>


                        <h2 class="user-name">

                            <%= user.getUserName() %>

                        </h2>


                        <p class="user-email">

                            <%= user.getEmail() %>

                        </p>


                    </div>


                </div>



                <!-- EDIT PROFILE -->

                <a href="editProfile"
                   class="edit-button">

                    Edit Profile

                </a>


            </div>



            <!-- PERSONAL INFORMATION -->

            <div class="information-section">


                <h2 class="section-title">

                    Personal Information

                </h2>



                <!-- NAME -->

                <div class="information-row">


                    <div class="information-label">

                        Full Name

                    </div>


                    <div class="information-value">

                        <%= user.getUserName() %>

                    </div>


                </div>



                <!-- EMAIL -->

                <div class="information-row">


                    <div class="information-label">

                        Email Address

                    </div>


                    <div class="information-value">

                        <%= user.getEmail() %>

                    </div>


                </div>



                <!-- ADDRESS -->

                <div class="information-row">


                    <div class="information-label">

                        Primary Address

                    </div>


                    <div class="information-value">

                        <%= user.getAddress() %>

                    </div>


                </div>


            </div>


        </section>



        <!-- =================================
             ACCOUNT OPTIONS
        ================================= -->

        <section class="account-options">


            <!-- MY ORDERS -->

            <a href="orders"
               class="option-card">


                <div class="option-content">


                    <div class="option-icon">

                        O

                    </div>


                    <div class="option-text">


                        <h3>

                            My Orders

                        </h3>


                        <p>

                            View your order history

                        </p>


                    </div>


                </div>


                <span class="option-arrow">

                    →

                </span>


            </a>



            <!-- ADDRESSES -->

            <a href="addresses"
               class="option-card">


                <div class="option-content">


                    <div class="option-icon">

                        A

                    </div>


                    <div class="option-text">


                        <h3>

                            Addresses

                        </h3>


                        <p>

                            Manage delivery addresses

                        </p>


                    </div>


                </div>


                <span class="option-arrow">

                    →

                </span>


            </a>


        </section>


    </main>


</body>

</html>