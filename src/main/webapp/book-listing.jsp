<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Listing</title>

        <!-- Bootstrap & Icons -->
        <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="mainpage.css">

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
            }

            .content {
                background-color: #003166;
                color: white;
            }

            .header {
                font-family: 'Times New Roman', Times, serif;
                padding: 10px 30px;
                margin: 0;
                background-color: #003166;
            }

            .white-text {
                color: white !important;
            }

            .table thead {
                background-color: #003166;
                color:#003166;
            }

            .navbar:hover {
                background-color: #007BFF;
            }

            .navbar a:hover {
                color: blue;
            }

            .container {
                margin-top: 40px;
            }
        </style>
    </head>
    <body>

        <!-- Header & Navbar -->
        <div class="content white-text">
            <h4 class="header">Universiti Malaysia Terengganu Library</h4>
            <nav class="navbar navbar-expand-lg" style="font-size: 20px; background-color:#003166 !important;">
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
                            <a href="StaffBorrowHistory" class="btn border me-2" style="background-color: #012a57; color:white;">Edit Borrow History</a>
                        </form>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="container">
            <h2 class="mt-5 mb-4">List of Books</h2>
            <table class="table table-bordered table-hover text-center">
                <thead style="background-color: #003166;">
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
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            String dbHost = System.getenv().getOrDefault("DB_HOST", "localhost");
                            String dbPort = System.getenv().getOrDefault("DB_PORT", "3306");
                            String dbName = System.getenv().getOrDefault("DB_NAME", "library");
                            String dbUser = System.getenv().getOrDefault("DB_USER", "root");
                            String dbPassword = System.getenv().getOrDefault("DB_PASSWORD", "admin");

                            String jdbcURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

                            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM book");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("bookid")%></td>
                        <td><%= rs.getString("bookTitle")%></td>
                        <td><%= rs.getString("bookAuthor")%></td>
                        <td><%= rs.getDate("datePublished")%></td>
                        <td><%= rs.getString("synopsis")%></td>
                        <td>
                            <a href="edit-form.jsp?bookid=<%= rs.getInt("bookid")%>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteBookServlet?bookid=<%= rs.getInt("bookid")%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>

            <div class="mt-4">
                <a href="book-form.jsp" class="btn btn-secondary">⬅ Back</a>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>

