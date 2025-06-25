<%-- 
    Document   : BorrowHistory
    Created on : 14 Jun 2025, 9:46:55 pm
    Author     : Asus
--%>

<%@page import="com.Model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.Model.BorrowRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int userid = user.getUserid();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Borrow History</title>
        <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
            }

            .content{
                background-color: #003366;
                color: white;
            }

            .history-table {
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            .history-table th, .history-table td {
                border: 1px solid #ccc;
                padding: 12px;
                text-align: center;
            }
            .history-table th {
                background-color: #003366;
                color: white;
            }

            select {
                width: 100%;
                padding: 10px;
                margin: 20px 0;
            }
            body { background-color: #f8f9fa; }

        .book-card {
            margin-bottom: 20px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .book-card:hover { transform: scale(1.02); }
        .book-img { width: 150px; height: 220px; object-fit: cover; border-radius: 10px; }
        .book-info { padding: 15px; }
        .book-title { font-size: 1.5rem; font-weight: bold; }
        .book-author { font-size: 1rem; color: gray; }
        .summary { margin-top: 10px; color: #555; }
        .members { margin-top: 10px; font-weight: bold; }

        .end { background-color: #343a40; color: white; padding: 20px 0; margin-top: 100px; }
        .endcontainer img { margin: 0 10px; cursor: pointer; transition: transform 0.2s; }
        .endcontainer img:hover { transform: scale(1.1); }

        .navbar:hover { background-color: #007BFF; }
        .navbar a:hover { color: blue; }

        .white-text { color: white !important; }

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

        <div class="container">
            <h2>Borrow & Return History</h2>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Book ID</th>
                        <th>Book Name</th>
                        <th>Return By</th>
                        <th>Return Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BorrowRecord> records = (List<BorrowRecord>) request.getAttribute("borrowRecords");
                        if (records != null) {
                            for (BorrowRecord r : records) {
                                String status = (r.getReturnDate() != null) ? "Returned" : "Borrowed";
                    %>
                    <tr>
                        <td><%= r.getBookid()%></td>
                        <td><%= r.getBookTitle()%></td>
                        <td><%= r.getReturnBy()%></td>
                        <td><%= (r.getReturnDate() != null) ? r.getReturnDate() : "-"%></td>
                        <td><%= r.getStatus()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="5">No records found.</td></tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
