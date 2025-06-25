<%-- 
    Document   : BorrowBook
    Created on : 12 Jun 2025, 2:39:06 am
    Author     : Asus
--%>

<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow Book</title>
    <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }
        

        .content {
            background-color: #003166;
            color: white;
        }

        .form-container {
            margin: 50px auto;
            width: 50%;
            text-align: center;
        }

        .btn-submit {
            background-color: #012a57;
            color: white;
        }

        .btn-submit:hover {
            background-color: #01458a;
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 20px 0;
        }

            .container {
                padding: 0 16px;
                text-align: center;
            }

            .container::after, .row::after {
                content: "";
                clear: both;
                display: table;
            }

            .button {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
            }

            @media screen and (max-width: 650px) {
                .column {
                    width: 100%;
                    display: block;
                }
            }
            
            .main-title {
                background-color: white;
                color: black;
                padding-top: 30px;
                padding-left: 30px;
                border-top-left-radius: 50px;
                margin-left: 100px;
                margin-right: 50px;
                margin-top: -50px; /* Adjust as needed */
                position: relative;
                z-index: 2;
            }
            .remove-decoration {
                text-decoration: none;
            }
            .container{
                margin-top: 50px;
            }
            .sub-title{
                margin-right: 500px;
                /* padding-right: 500px; */
                position: relative;
            }
            .helpful{
                background-color: whitesmoke;
                /* border: 50px; */
                height: fit-content;
                width: 200px;
                border-radius: 10px;
            }
            .end{
                background-color: #003166;
            }
            @media screen and (max-width: 768px) {
                .main-title {
                    margin-right: 0;
                    margin-left: 50px;
                }
                .sub-title{
                    margin-right: 0;
                }
                .right-div{
                    display: none;
                }

            }
            /* Set right margin to 0 for smaller screens */
            .carousel {
                z-index: 1;
            }
            .white-text { /* White text*/
                color: white !important;
            }
            .max-height {
                max-height: 400px; /* Set your desired maximum height */
                min-height: 400px;
                margin: auto; /* Center the image horizontally */
            }
            .header{
                font-family: 'Times New Roman', Times, serif;
            }
            .slideshow{
                max-width: 300px;
                max-height: 300px;
            }
            .right-div {
                color: #003166;
                float: right; /* Set the float property to right */
                max-width: 500px; /* Set a width to the div if needed */
                max-height: 100vh; /* Set a height to the div if needed */
                /* background-color: whitesmoke; */ /* Add background color for visibility */
                margin-right: 100px;
            }

            /* Clear the float to prevent content below from wrapping around */
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }

            /* Optional: Apply styles to the content below */
            .content {
                /* Add styles for the content below */
                padding: 20px;
            }
            /* Add hover effect for the navbar */
            .navbar:hover {
                background-color: #007BFF; /* Change the background color on hover */
            }

            /* Add hover effect for the navbar links */
            .navbar a:hover {
                color: blue; /* Change the text color on hover */
            }

            .fa {
                padding: 20px;
                font-size: 50px;
                margin: 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                transition: opacity 0.3s;
            }

            /* Add a hover effect if you want */
            .fa:hover {
                opacity: 0.7;
            }
            /* Facebook */
            .fa-facebook {
                background: #3B5998;
                color: white;
            }
            /* Twitter */
            .fa-twitter {
                background: #55ACEE;
                color: white;
            }

            .endcontainer img,
            .endcontainer p {
                display: inline-block;
                vertical-align: middle;
                border-radius: 10px;
                margin-right: 10px;
            }
            .endcontainer{
                padding: 20px;
            }
            .copyright{
                padding: 5px;
                margin-left: 20px;
            }
    </style>
</head>
<body>

<!-- Header and Navbar -->
        <div class="content white-text" style="background-color: #003166;"> <!-- Navigation-->

            <h4 class="header">Universiti Malaysia Terengganu Library</h4>
            <nav class="navbar navbar-expand-lg bg-body-tertiary" style="font-size: 20px;background-color:#003166 !important;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse rounded"  id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                            <li class="nav-item">
                                <a class="nav-link active white-text" aria-current="page" href="Homepage2.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link white-text " href="AboutUs.jsp" >About Us</a>
                            </li>
                            <li>
                                <a class="nav-link white-text " href="ContactUs.jsp" >Contact Us</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle white-text" href="#" role="button" 
                                   data-bs-toggle="dropdown" aria-expanded="false">Collection</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="BookCollection.jsp">Our Collection</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex align-items-center flex-nowrap" role="search">
                            
                            <a href="profile.jsp" class="btn border me-2" style="background-color: #012a57; color:white; white-space: nowrap;">View Profile</a>
                            
                            <a href="BorrowHistory" class="btn border me-2 white-text" style="background-color: #012a57; white-space: nowrap;">Borrow and Return History</a>

                            <a href="BorrowBook.jsp" class="btn border me-2" style="background-color: #012a57; color:white; white-space: nowrap;">Borrow Books</a>
                        </form>

                    </div>
                </div>

            </nav>
    </div>

<!-- Book Dropdown -->
<div class="form-container">
    <h2>Select a Book to Borrow</h2>
    <form action="BorrowConfirmation.jsp" method="post">
        <label for="bookid">Choose Book:</label>
        <select name="bookid" id="bookid" required>
            <option value="" disabled selected>-- Select Book --</option>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    conn = DBConnection.getConnection();
                    String query = "SELECT bookid, bookTitle FROM book WHERE status = 'available'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        int bookid = rs.getInt("bookid");
                        String bookTitle = rs.getString("bookTitle");
            %>
            <option value="<%= bookid %>"><%= bookTitle %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error loading books</option>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </select>
        <button type="submit" class="btn btn-submit">Select</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
