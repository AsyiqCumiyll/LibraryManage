<%@page import="com.Model.User"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User users = (User) session.getAttribute("user");

    if (users == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userid = users.getUserid();
    String username = users.getUsername();

    String bookidParam = request.getParameter("bookid");
    int bookid = bookidParam != null ? Integer.parseInt(bookidParam) : 0;

    String bookTitle = "";
    String synopsis = "";

    if (bookid > 0) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT bookTitle, synopsis FROM book WHERE bookid = ?");
            ps.setInt(1, bookid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bookTitle = rs.getString("bookTitle");
                synopsis = rs.getString("synopsis");
            }
        } catch (Exception e) {
            out.println("<p class='text-danger'>Error fetching book data: " + e.getMessage() + "</p>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow Confirmation</title>
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
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 20px 0;
        }

            .container {
                padding: 0 16px;
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

            .right-div {
                color: #003166;
                float: right; /* Set the float property to right */
                max-width: 500px; /* Set a width to the div if needed */
                max-height: 100vh; /* Set a height to the div if needed */
                /* background-color: whitesmoke; */ /* Add background color for visibility */
                margin-right: 100px;
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

        .table th {
            background-color: #003166;
            color: white;
        }

        .btn-submit {
            background-color: #012a57;
            color: white;
        }

        .btn-submit:hover {
            background-color: #01458a;
        }

    </style>
</head>
<body>
    <!-- Flash Message -->
    <% String msg = (String) request.getAttribute("message"); %>
    <% if (msg != null) { %>
        <div class="alert alert-success alert-dismissible fade show text-center w-100 mb-0 rounded-0"
             role="alert"
             style="position: absolute; top: 10px; left: 50%; transform: translateX(-50%); width: 60%; z-index: 9999; opacity: 0.95;">
            ✅ <%= msg %>
            <button type="button" class="btn-close" aria-label="Close"
                    onclick="window.location.href = 'BorrowBook.jsp'"></button>
        </div>
    <% } %>

    <!-- Disable button if already submitted -->
    <% if (msg != null && msg.contains("successfully")) { %>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("button[type='submit']").disabled = true;
        });
    </script>
    <% } %>

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

    <!-- Borrow Confirmation Form -->
    <div class="form-container">
        <h2 class="text-center">Borrow Confirmation</h2>
        <form action="BorrowBookServlet" method="post">
            <table class="table table-bordered">
                <tr><th>User ID</th><td><%= userid %></td></tr>
                <tr><th>Username</th><td><%= username %></td></tr>
                <tr><th>Book ID</th><td><%= bookid %></td></tr>
                <tr><th>Book Title</th><td><%= bookTitle %></td></tr>
                <tr><th>Synopsis</th><td><%= synopsis %></td></tr>
            </table>

            <!-- Hidden Inputs -->
            <input type="hidden" name="userid" value="<%= userid %>">
            <input type="hidden" name="bookid" value="<%= bookid %>">

            <!-- Borrow & Return Fields -->
            <div class="mb-3">
                <label for="borrowDate" class="form-label">Select Borrow Date:</label>
                <input type="date" class="form-control" id="borrowDate" name="borrowDate"
                       onchange="setReturnBy()"
                       min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
            </div>

            <div class="mb-3">
                <label for="returnBy" class="form-label">Return By:</label>
                <input type="text" class="form-control" id="returnBy" name="returnBy" readonly>
            </div>

            <button type="submit" class="btn btn-submit">Confirm Borrow</button>
        </form>
    </div>

    <!-- JS to Calculate Return Date -->
<script>
function setReturnBy() {
    const borrowInput = document.getElementById("borrowDate");
    const returnInput = document.getElementById("returnBy");

    const borrowDateValue = borrowInput.value;
    console.log("Selected Borrow Date:", borrowDateValue);

    if (borrowDateValue) {
        const borrowDate = new Date(borrowDateValue);
        console.log("Parsed Date:", borrowDate);

        // Add 14 days
        borrowDate.setDate(borrowDate.getDate() + 14);
        console.log("Return By (raw):", borrowDate);

        // Format date as dd/mm/yy
        const dd = String(borrowDate.getDate()).padStart(2, '0');
        const mm = String(borrowDate.getMonth() + 1).padStart(2, '0');
        const yy = borrowDate.getFullYear().toString().slice(-2);

        const formatted = dd + "/" + mm + "/" + yy;
        console.log("Formatted Return Date:", formatted);

        returnInput.value = formatted;
    } else {
        returnInput.value = "";
    }
}
</script>


</body>
</html>
