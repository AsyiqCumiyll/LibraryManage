package com.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection info using environment variables with fallback defaults
    private String dbHost = System.getenv().getOrDefault("DB_HOST", "localhost");
    private String dbPort = System.getenv().getOrDefault("DB_PORT", "3306");
    private String dbName = System.getenv().getOrDefault("DB_NAME", "library_man");
    private String jdbcUsername = System.getenv().getOrDefault("DB_USER", "root");
    private String jdbcPassword = System.getenv().getOrDefault("DB_PASSWORD", "joeYYBcSQddIDVtKhDyjpDoRoGhHGPeE");

    private String jdbcURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO users (userid, username, email, phone, address, password) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(sql);
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
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
