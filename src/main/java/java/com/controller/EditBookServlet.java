package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("bookid");
        String title = request.getParameter("bookTitle");
        String author = request.getParameter("bookAuthor");
        String datePublished = request.getParameter("datePublished");
        String synopsis = request.getParameter("synopsis");

        if (id == null || title == null || author == null) {
            response.getWriter().println("Error: Missing required fields.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                         "UPDATE book SET bookTitle=?, bookAuthor=?, datePublished=?, synopsis=? WHERE bookID=?")) {

                stmt.setString(1, title);
                stmt.setString(2, author);
                stmt.setString(3, datePublished);
                stmt.setString(4, synopsis);
                stmt.setInt(5, Integer.parseInt(id));

                stmt.executeUpdate();

                response.sendRedirect("book-listing.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating book: " + e.getMessage());
        }
    }
}
