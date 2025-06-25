package com.controller;

import com.Model.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Validate DB configuration
        if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database configuration missing.");
            return;
        }

        String staffid = request.getParameter("staffid");
        String staffName = request.getParameter("staffName");
        String password = request.getParameter("password");

        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pst = con.prepareStatement(
                     "SELECT * FROM staff WHERE staffid = ? AND staffName = ? AND password = ?")) {

            pst.setString(1, staffid);
            pst.setString(2, staffName);
            pst.setString(3, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffid(rs.getInt("staffid"));
                    staff.setStaffName(rs.getString("staffName"));
                    staff.setPassword(rs.getString("password"));

                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staff);

                    response.sendRedirect("Homepage3.jsp");
                } else {
                    response.sendRedirect("stafflogin.jsp?error=Invalid credentials.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}
