<%-- 
    Document   : Homepage3
    Created on : 18 Jun 2025, 2:08:02 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

                <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
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
        
        <div> <!--Slideshow start here-->
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Image1.jpeg" class="d-block w-100 max-height" alt="Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="Image2.jpeg" class="d-block w-100 max-height" alt="Image 2">
                    </div>
                    <div class="carousel-item">
                        <img src="Login Page.jpg" class="d-block w-100 max-height" alt="Image 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="main-title clearfix"> <!-- Title start here  -->
            <div class="right-div header">
                <h3>FINDING RESOURCES</h3>
                <ul>
                    <li><a style="text-decoration: none;" style="text-decoration: none; color: white;" href="book listing.html">Book Listing</a></li> <!-- To book listing-->
                    <li><a style="text-decoration: none;" href="book listing.html">Contact Us</a></li>
                </ul>
            </div>
            <h1><b><u>Library</u></b></h1>
            <div class="sub-title clearfix">
                <hr>
                <h2>University Malaysia Terengganu</h2>
                <p>Sultanah Nur Zahirah Libraries at the University Malaysia Terenggau is one of the largest university library system in Malaysia. 
                    The Libraries hold more than
                    12 million printed items, over 80,000 e-journals and outstanding special collections including rare books
                    and manuscripts, classical papyri, maps, music, art and printed ephemera. Members of the public can explore
                    the collections via the library website's or by visiting the
                    exhibition galleries in the university.
                    Have you ever wondered what it's like to study in the University Malaysia Terengganu? Tune in and listen to the sounds of Malaysia most famous library.</p>
                <hr>
                <p>Every University has its own library, often consisting of a modern, working library and older collections. See more information about us <a style="text-decoration: none;" href="about us.html">here</a></p>
            </div> 
            <br>
            <div class="helpful">
                <p><b>Was This Helpful?</b></p>
                <div class="container mt-5">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="radioOptions" id="option1" value="option1">
                                    <label class="form-check-label" for="option1">Yes</label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="radioOptions" id="option2" value="option2">
                                    <label class="form-check-label" for="option2">No</label>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3" id="additionalInputBox" style="display: none;">
                            <input type="text" class="form-control" id="additionalInput" placeholder="Tell us more...">
                        </div>

                        <button type="button" class="btn btn-primary" id="submitButton">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <br>
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

        <script src="MainPage.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
    </body>
</html>
