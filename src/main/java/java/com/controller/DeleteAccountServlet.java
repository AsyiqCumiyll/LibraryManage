package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/account_deleted")
public class DeleteAccountServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection info using environment variables
    private String dbHost = System.getenv().getOrDefault("DB_HOST", "localhost");
    private String dbPort = System.getenv().getOrDefault("DB_PORT", "3306");
    private String dbName = System.getenv().getOrDefault("DB_NAME", "library_man");
    private String jdbcUsername = System.getenv().getOrDefault("DB_USER", "root");
    private String jdbcPassword = System.getenv().getOrDefault("DB_PASSWORD", "joeYYBcSQddIDVtKhDyjpDoRoGhHGPeE");

    private String jdbcURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "DELETE FROM users WHERE user_id = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, userId);

            int rowsDeleted = pst.executeUpdate();

            if (rowsDeleted > 0) {
                // Successfully deleted
                response.sendRedirect("account_deleted.jsp");
            } else {
                response.getWriter().println("Error: User not found or could not delete.");
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
