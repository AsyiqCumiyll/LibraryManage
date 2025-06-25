<%-- 
    Document   : stafflogin
    Created on : 11 Jun 2025, 11:00:05 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login - UMT Library</title>
  <style>
    body {font-family: Arial, Helvetica, sans-serif;}

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #4359ea;
      box-sizing: border-box;
    }

    button {
      background-color: #04AA6D;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }

    .container {
      padding: 16px;
    }

    span.psw {
      float: right;
      padding-top: 16px;
    }

    .close:hover, .close:focus {
      color: red;
      cursor: pointer;
    }

    @media screen and (max-width: 300px) {
      span.psw {
        display: block;
        float: none;
      }
      .cancelbtn {
        width: 100%;
      }
    }
    body {
            background-color: #f8f9fa;
        }
        .profile-card {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .profile-card h2 {
            margin-bottom: 20px;
        }
        .profile-card ul {
            list-style: none;
            padding: 0;
        }
        .profile-card ul li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
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

  <link rel="stylesheet" href="mainpage.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>
  <div class="content white-text" style="background-color: #003166;">
    <h4 class="header">Universiti Malaysia Terengganu Library</h4>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="font-size: 20px;background-color:#003166 !important;">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
          <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link active white-text" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link white-text" href="aboutus.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link white-text" href="contactus.jsp">Contact Us</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle white-text" href="#" role="button" data-bs-toggle="dropdown">Collection</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="booklisting.jsp">Our Collection</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search...">
            <a href="booklisting.jsp" class="btn border me-2 white-text" style="background-color: #012a57;">Search</a>
            <a href="login.jsp" class="btn border me-2 white-text" style="background-color: #012a57;">Login</a>
          </form>
        </div>
      </div>
    </nav>
  </div>

  <h2 class="text-center mt-4">Staff Login</h2>

  <div class="container col-md-4 mx-auto border rounded shadow-sm p-4 mt-4">
    <form action="StaffLoginServlet" method="post">
      <label for="staffid"><b>StaffID</b></label>
      <input type="text" placeholder="Enter Staff ID" name="staffid" id="staffid" required>
      
      <label for="staffName"><b>Staff Name</b></label>
      <input type="text" placeholder="Enter Staff Name" name="staffName" id="staffName" required>

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" id="password" required>

      <button type="submit">Login</button>
      

      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>

      <div class="mt-3">
        <button type="button" class="cancelbtn" onclick="window.location.href='Homepage1.jsp'">Cancel</button>
        
      </div>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

