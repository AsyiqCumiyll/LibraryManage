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
        <title>Book Listing</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

            .book-table {
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
            }

            .book-table th, .book-table td {
                border: 1px solid #ccc;
                padding: 12px;
                text-align: center;
            }

            .book-table th {
                background-color: #003366;
                color: white;
            }

            .btn-sm {
                padding: 5px 10px;
            }

            .container h2 {
                margin-top: 20px;
                text-align: center;
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
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            String dbHost = System.getenv().getOrDefault("DB_HOST", "localhost");
                            String dbPort = System.getenv().getOrDefault("DB_PORT", "3306");
                            String dbName = System.getenv().getOrDefault("DB_NAME", "library");
                            String dbUser = System.getenv().getOrDefault("DB_USER", "root");
                            String dbPassword = System.getenv().getOrDefault("DB_PASSWORD", "admin");

                            String jdbcURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

                            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
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
                            <form action="BorrowConfirmation.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="bookid" value="<%= bookid%>">
                                <%
                                    int userid = 0;
                                    if (users != null) {
                                        userid = users.getUserid(); // or getId(), based on your method
                                    } else if (staff != null) {
                                        userid = staff.getStaffid(); // or getId()
                                    } else {
                                        response.sendRedirect("login.jsp"); // not logged in
                                        return;
                                    }
                                %>

                                <input type="hidden" name="userid" value="<%= userid%>">

                                <button type="submit" class="btn btn-success btn-sm">Borrow</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    %>
                    <tr><td colspan="6" class="text-danger">Error loading books: <%= e.getMessage()%></td></tr>
                    <%
                        } finally {
                            if (rs != null) try {
                                rs.close();
                            } catch (Exception e) {
                            }
                            if (stmt != null) try {
                                stmt.close();
                            } catch (Exception e) {
                            }
                            if (conn != null) try {
                                conn.close();
                            } catch (Exception e) {
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
