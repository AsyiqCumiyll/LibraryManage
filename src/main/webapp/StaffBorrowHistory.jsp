<%-- 
    Document   : StaffBorrowHistory
    Created on : 15 Jun 2025, 9:19:28 pm
    Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="com.Model.BorrowRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Borrow History</title>
        <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

            .main-title {
                background-color: white;
                color: black;
                padding-top: 30px;
                padding-left: 30px;
                border-top-left-radius: 50px;
                margin-left: 100px;
                margin-right: 50px;
                margin-top: -50px;
                position: relative;
                z-index: 2;
            }
            .remove-decoration {
                text-decoration: none;
            }
            .container {
                margin-top: 50px;
            }
            .sub-title {
                margin-right: 500px;
                position: relative;
            }
            .helpful {
                background-color: whitesmoke;
                height: fit-content;
                width: 200px;
                border-radius: 10px;
            }
            .end {
                background-color: #003166;
            }
            @media screen and (max-width: 768px) {
                .main-title {
                    margin-right: 0;
                    margin-left: 50px;
                }
                .sub-title {
                    margin-right: 0;
                }
                .right-div {
                    display: none;
                }
            }
            .carousel {
                z-index: 1;
            }
            .white-text {
                color: white !important;
            }
            .max-height {
                max-height: 400px;
                min-height: 400px;
                margin: auto;
            }
            .header {
                font-family: 'Times New Roman', Times, serif;
            }
            .slideshow {
                max-width: 300px;
                max-height: 300px;
            }
            .right-div {
                color: #003166;
                float: right;
                max-width: 500px;
                max-height: 100vh;
                margin-right: 100px;
            }
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }
            .content {
                padding: 20px;
            }
            .navbar:hover {
                background-color: #007BFF;
            }
            .navbar a:hover {
                color: blue;
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
            .fa:hover {
                opacity: 0.7;
            }
            .fa-facebook {
                background: #3B5998;
                color: white;
            }
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
            .endcontainer {
                padding: 20px;
            }
            .copyright {
                padding: 5px;
                margin-left: 20px;
            }

        </style>
    </head>
    <body>
        <!-- Header and Navbar -->
        <div class="content white-text" style="background-color: #003166;">
            <h4 class="header">Universiti Malaysia Terengganu Library</h4>
            <nav class="navbar navbar-expand-lg bg-body-tertiary" style="font-size: 20px;background-color:#003166 !important;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active white-text" href="Homepage3.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link white-text" href="AboutUs.jsp">About Us</a>
                            </li>
                            <li>
                                <a class="nav-link white-text" href="ContactUs.jsp">Contact Us</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle white-text" href="#" role="button" data-bs-toggle="dropdown">Collection</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="BookCollection.jsp">Our Collection</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex align-items-center flex-nowrap" role="search">

                            <a href="StaffBorrowHistory" class="btn border me-2" style="background-color: #012a57; color:white; white-space: nowrap;">Edit Borrow History</a>
                        </form>
                    </div>
                </div>
            </nav>
        </div>

        <div class="container"> <br>
            <h2>Borrow & Return History</h2>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Borrow ID</th>
                        <th>Borrow Date</th>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Book ID</th>
                        <th>Book Name</th>
                        <th>Return By</th>
                        <th>Return Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BorrowRecord> records = (List<BorrowRecord>) request.getAttribute("borrowRecords");
                        if (records != null && !records.isEmpty()) {
                            for (BorrowRecord r : records) {
                    %>

                    <tr>
                        <td><%= r.getBorrowid()%></td>
                        <td><%= r.getBorrowDate()%></td>
                        <td><%= r.getUserid()%></td>
                        <td><%= r.getUsername()%></td>
                        <td><%= r.getBookid()%></td>
                        <td><%= r.getBookTitle()%></td>
                        <td><%= r.getReturnBy()%></td>
                        <td><%= r.getReturnDate() != null ? r.getReturnDate() : "-"%></td>
                        <td><%= r.getStatus()%></td>
                        <td>
                            <% if (!"Returned".equalsIgnoreCase(r.getStatus())) {%>
                            <form action="UpdateBorrowStatus" method="post">
                                <input type="hidden" name="borrowid" value="<%= r.getBorrowid()%>">
                                <button type="submit" class="btn btn-sm btn-success">Mark as Returned</button>
                            </form>
                            <% } else { %>
                            <span class="text-success">Completed</span>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="9">No records found.</td></tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
