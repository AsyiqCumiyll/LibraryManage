package com.controller;

import com.Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database configuration missing.");
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement pst = con.prepareStatement(
                         "SELECT * FROM users WHERE email = ? AND password = ?")) {

                pst.setString(1, email);
                pst.setString(2, password);

                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) {
                        User user = new User();
                        user.setUserid(rs.getInt("userid"));
                        user.setUsername(rs.getString("username"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(rs.getString("password"));
                        user.setPhone(rs.getString("phone"));
                        user.setAddress(rs.getString("address"));

                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);

                        response.sendRedirect("Homepage2.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=Invalid credentials.");
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}
