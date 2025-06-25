<%@page import="com.Model.Staff"%>
<%@page import="com.Model.User"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    User users = (com.Model.User) session.getAttribute("user");
    Staff staff = (com.Model.Staff) session.getAttribute("staff");
    if (users == null && staff == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

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

        <div class="container">
            <h2>List of Books</h2>
            <table class="book-table">
                <thead>
                    <tr>
                        <th>Book ID</th>
                        <th>Book Title</th>
                        <th>Book Author</th>
                        <th>Date Published</th>
                        <th>Synopsis</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%@ page import="java.sql.*" %>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            String DB_URL = System.getenv("DB_URL");
                            String DB_USER = System.getenv("DB_USER");
                            String DB_PASSWORD = System.getenv("DB_PASSWORD");

                            if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
                                out.println("<p>Database configuration is missing.</p>");
                                return;
                            }

                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM book");

                            while (rs.next()) {
                                int bookid = rs.getInt("bookid");
                    %>
                    <tr>
                        <td><%= bookid%></td>
                        <td><%= rs.getString("bookTitle")%></td>
                        <td><%= rs.getString("bookAuthor")%></td>
                        <td><%= rs.getDate("datePublished")%></td>
                        <td><%= rs.getString("synopsis")%></td>
                        <td>
                            <a href="edit-form.jsp?bookid=<%= bookid%>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteBookServlet?bookid=<%= bookid%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
