<%-- 
    Document   : AboutUs
    Created on : 11 Jun 2025, 10:42:40 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            /* Base Styling */
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
                background-color: #f8f9fa;
            }

            .white-text {
                color: white !important;
            }

            .navbar a:hover {
                color: blue;
            }

            .navbar:hover {
                background-color: #007BFF;
            }

            html {
                box-sizing: border-box;
            }

            *, *:before, *:after {
                box-sizing: inherit;
            }

            /* Header and Navbar */
            .header {
                font-family: 'Times New Roman', Times, serif;
                color: white;
                padding: 10px 0;
                background-color: #003166;
                text-align: center;
            }

            .navbar {
                background-color: #003166 !important;
            }

            .navbar .nav-link {
                color: white !important;
                font-size: 18px;
            }

            .navbar .nav-link:hover {
                color: lightblue !important;
            }

            .navbar .dropdown-menu a {
                color: black !important;
            }

            .navbar-toggler {
                background-color: white;
            }

            /* About/Contact Section Header */
            .about-section {
                padding: 30px 20px;
                text-align: center;
                background-color: #474e5d;
                color: white;
            }

            /* Cards (Used for team or contact cards) */
            .column {
                float: left;
                width: 33.3%;
                margin-bottom: 16px;
                padding: 0 8px;
            }

            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                margin: 8px;
                border-radius: 8px;
            }

            .container {
                padding: 0 16px;
                margin-top: 50px;
                text-align: center;
            }

            .container::after, .row::after {
                content: "";
                clear: both;
                display: table;
            }

            .title {
                color: grey;
            }

            /* General Button Style */
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
                border-radius: 5px;
            }

            .button:hover {
                background-color: #555;
            }

            /* Login & Form Containers */
            .login-container, .form-container {
                max-width: 400px;
                margin: 50px auto;
                padding: 30px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: white;
                box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            }

            .login-container input[type="text"],
            .login-container input[type="password"],
            .form-container input[type="text"],
            .form-container input[type="password"],
            .form-container input[type="email"],
            .form-container input[type="date"],
            .form-container textarea {
                width: 100%;
                padding: 10px;
                margin: 8px 0 20px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .login-container button,
            .form-container button {
                width: 100%;
                padding: 10px;
                background-color: #003366;
                color: white;
                border: none;
                border-radius: 5px;
                margin-bottom: 15px;
                cursor: pointer;
            }

            .login-container button:hover,
            .form-container button:hover {
                background-color: #012a57;
            }

            .cancelbtn {
                background-color: #dc3545;
            }

            .cancelbtn:hover {
                background-color: #c82333;
            }

            .links {
                text-align: center;
                margin-top: 15px;
            }

            .form-container .text-center a {
                text-decoration: none;
                color: #003366;
            }

            /* Social Media Buttons */
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

            /* Footer */
            .footer, .end {
                background-color: #003166;
                color: white;
                padding: 20px 0;
                text-align: center;
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

            /* Responsive Design */
            @media screen and (max-width: 768px) {
                .column {
                    width: 100%;
                    display: block;
                }
                .main-title, .sub-title {
                    margin-left: 50px;
                    margin-right: 0;
                }
                .right-div {
                    display: none;
                }
            }

        </style>
    </head>
    <body>
<div class="content white-text" style="background-color: #003166;"> <!-- Header Top Bar -->
    <div class="container-fluid d-flex align-items-center" style="padding: 10px 20px;">
        <h4 class="header m-0" style="color: white;">Universiti Malaysia Terengganu Library</h4>
    </div>

    <nav class="navbar navbar-expand-lg" style="font-size: 20px; background-color: #003166 !important;">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link white-text" style="color:white" href="Homepage1.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link white-text" style="color:white" href="AboutUs.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link white-text" style="color:white" href="ContactUs.jsp">Contact Us</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle white-text" href="#" role="button" 
                           data-bs-toggle="dropdown" style="color:white" aria-expanded="false">Collection</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="BookCollection.jsp">Our Collection</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <a href="login.jsp" class="btn border me-2 white-text" style="background-color: #012a57; color:white">Login</a>
                </form>
            </div>
        </div>
    </nav>
</div>

        <div class="about-section">
            <h1>About Us Page</h1>
            <div class="card">
                <div class="container">
                    <img src="history.png" alt="Logo" width="300" height="300" class="d-inline-block align-text-middle">
                    <h2><p class="round1">The History of University Malaysia Terengganu (UMT) library started with the establishment of UPM Fisheries and Maritime Science Centre (Pusat Perikanan dan Sains Samudera UPM) in May 1979. The library was manned by two library clerks. At that time, the library was just a small room in the Administration Unit. The area was 40 feet x 30 feet with 28 chairs.
                        </p></h2>
                </div>
            </div>


            In 1981, the staffs increased to 5 staffs : 1 Library Clerk, 2 Library Checkers and 2 Library Attendants. The library began to operate at night in January 1982.</p></h2>


    <p class="round1">The library has changed its location 4 times. The first move was on December 1984, from the Administration building to the Net loft building. Second moved was on June 14th, 1986 from the Net loaf building to the Hostel A building, and the third was on November 28th, 1988 from the Hostel a building to its own building, and has been used till 31 July 2004. On January 1987, the library’s staff increased to 6 persons. They were 2 Library Assistants, 
        2 Library Checkers and 2 Library Attendants
    </p>
    <p class="round1">A librarian from UPM Serdang has joins the library in 1996.

        On 5th May 1999, UPM Terengganu (UPMT) ceased to exist and replaced Kolej Universiti Terengganu (KUT). KUT attained its autonomy as a university college on 1st May 2001. KUT was officially renamed as Kolej Universiti Sains dan Teknologi Malaysia (KUSTEM) on 1st July 2001.</p>

    <div class="card">
        <div class="container">
            <h4> Mission </h4>
            <h6>To provide services and facilities to customers by offering information services, library resources supported through the use of the latest technology to support learning, teaching, consulting and research in the field of Science, Technology and Natural Resource Management.</h6>
            <h4> Vision </h4>
            <h6>Library as a knowledge reference center.</h6>
            <h4> Objectives </h4>
            <li>To provide efficient services, effective, up-to-date and user friendly to the campus community and society in general.</li>
            <li>To optimize usage of various information resources and facilities.</li>
            <li>To upgrade staff expertise (knowledge workers).</li>
            <li>To improve the distribution of cost effectiveness.</li>
            <li>To strengthen user education program towards lifelong learning.</li>
            <li>To develop, document, maintain and strengthen teaching and research resources of all disciplines either in print, multimedia and electronic format.</li>
            <li>To uphold knowledge and intellectual property of university community in turning the library as a resource and knowledge heritage.</li>
        </div>
    </div>

    <div class="end white-text"> <!--End Page-->
        <!-- <h4>Connect With Us</h4>
        <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a> -->
        <div class="endcontainer">
            <p>Connect With Us</p>
            <a href="https://www.facebook.com">
                <img src="facebook.png" alt="Your Image" width="50" height="50">
            </a>
            <a href="https://www.tiktok.com">
                <img src="Tiktok.png" alt="Your Image" width="50" height="50">
            </a>
            <hr>
        </div>
        <div class="copyright">
            <p>&copy; 3N 2025. All rights reserved.</p>
        </div>
    </div> <!--End Page's End-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 

</body>
</html>
