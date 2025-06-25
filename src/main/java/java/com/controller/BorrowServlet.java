package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ✅ Environment variables for DB
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Debug output
            System.out.println("bookid: " + request.getParameter("bookid"));
            System.out.println("userid: " + request.getParameter("userid"));

            // Parse parameters
            int bookid = Integer.parseInt(request.getParameter("bookid"));
            int userid = Integer.parseInt(request.getParameter("userid"));

            // Validate DB config
            if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
                response.getWriter().println("Database configuration missing.");
                return;
            }

            // Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Use try-with-resources for safe connection handling
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO borrow (bookid, userid) VALUES (?, ?)")) {

                stmt.setInt(1, bookid);
                stmt.setInt(2, userid);

                int rowsAffected = stmt.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);
            }

            // Redirect after success
            response.sendRedirect("more-books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
