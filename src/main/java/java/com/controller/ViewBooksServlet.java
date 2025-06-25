package com.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {
    
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // HTML table header
        out.println("<html><head><title>Book Table</title></head><body>");
        out.println("<h2>Book Records</h2>");
        out.println("<table border='1' cellpadding='10'>");
        out.println("<tr style='background-color:#e0e0e0;'>");
        out.println("<th>bookId</th><th>bookTitle</th><th>bookAuthor</th><th>datePublished</th><th>synopsis</th>");
        out.println("</tr>");

        // Check if environment variables are set
        if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
            out.println("<p>Error: Database environment variables not set.</p>");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM book")) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // Print each book record
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("bookid") + "</td>");
                out.println("<td>" + rs.getString("bookTitle") + "</td>");
                out.println("<td>" + rs.getString("bookAuthor") + "</td>");
                out.println("<td>" + rs.getDate("datePublished") + "</td>");
                out.println("<td>" + rs.getString("synopsis") + "</td>");
                out.println("</tr>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }

        out.println("</table>");
        out.println("</body></html>");
        out.close();
    }
}
