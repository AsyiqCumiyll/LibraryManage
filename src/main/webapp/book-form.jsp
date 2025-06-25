<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Book</title>
        <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
                background-color: #f8f9fa;
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

            .content {
                background-color: #003366;
                color: white;
                padding: 10px 0;
            }

            .navbar .nav-link {
                color: white !important;
            }

            .navbar .dropdown-menu a {
                color: black !important;
            }

            .form-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: white;
                box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            }

            .form-container button {
                background-color: #003366;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
            }

            .form-container button:hover {
                background-color: #012a57;
            }

            .form-container .btn-secondary,
            .form-container .btn-warning {
                margin-left: 10px;
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

        <!-- Add Book Form -->
        <h2 class="text-center mt-4">Add New Book</h2>

        <div class="form-container">
            <form action="AddBookServlet" method="post">
                <div class="mb-3">
                    <label for="bookTitle" class="form-label">Title:</label>
                    <input type="text" name="bookTitle" id="bookTitle" class="form-control" placeholder="Enter book title" required />
                </div>

                <div class="mb-3">
                    <label for="bookAuthor" class="form-label">Author:</label>
                    <input type="text" name="bookAuthor" id="bookAuthor" class="form-control" placeholder="Enter author name" required />
                </div>

                <div class="mb-3">
                    <label for="datePublished" class="form-label">Date Published:</label>
                    <input type="date" name="datePublished" id="datePublished" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label for="synopsis" class="form-label">Synopsis:</label>
                    <textarea name="synopsis" id="synopsis" class="form-control" rows="4" placeholder="Enter a brief synopsis..." required></textarea>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success">Save Book</button>
                    <div>
                        <a href="BookCollection.jsp" class="btn btn-secondary">Back</a>
                        <a href="book-listing.jsp" class="btn btn-warning">Edit Book</a>
                    </div>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
