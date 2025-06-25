package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String bookTitle = request.getParameter("bookTitle");
        String bookAuthor = request.getParameter("bookAuthor");
        String datePublished = request.getParameter("datePublished");
        String synopsis = request.getParameter("synopsis");

        // Debug logging
        System.out.println("DEBUG - bookTitle: " + bookTitle);
        System.out.println("DEBUG - bookAuthor: " + bookAuthor);
        System.out.println("DEBUG - datePublished: " + datePublished);
        System.out.println("DEBUG - synopsis: " + synopsis);

        if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
            response.getWriter().println("Database configuration is missing.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                         "INSERT INTO book (bookTitle, bookAuthor, datePublished, synopsis) VALUES (?, ?, ?, ?)")) {

                stmt.setString(1, bookTitle);
                stmt.setString(2, bookAuthor);
                stmt.setString(3, datePublished);
                stmt.setString(4, synopsis);

                stmt.executeUpdate();
                response.sendRedirect("book-listing.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
