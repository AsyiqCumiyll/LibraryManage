package com.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Correct environment variable usage
    private static final String DB_URL      = System.getenv("DB_URL");      // Should be full JDBC URL: jdbc:mysql://host:port/dbname
    private static final String DB_USER     = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        try (
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO users (userid, username, email, phone, address, password) VALUES (?, ?, ?, ?, ?, ?)"
            )
        ) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            pst.setString(1, userid);
            pst.setString(2, username);
            pst.setString(3, email);
            pst.setString(4, phone);
            pst.setString(5, address);
            pst.setString(6, password);

            int result = pst.executeUpdate();

            if (result > 0) {
                response.getWriter().println("<script>alert('Registration Successful! Please login.'); window.location='login.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Registration Failed. Please try again.'); window.location='register.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='register.jsp';</script>");
        }
    }
}
