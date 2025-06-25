package com.controller;

import com.Model.Staff;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
// Database connection info using environment variables with fallback defaults
private String dbHost = System.getenv().getOrDefault("DB_HOST", "localhost");
private String dbPort = System.getenv().getOrDefault("DB_PORT", "3306");
private String dbName = System.getenv().getOrDefault("DB_NAME", "library");
private String jdbcUsername = System.getenv().getOrDefault("DB_USER", "root");
private String jdbcPassword = System.getenv().getOrDefault("DB_PASSWORD", "admin");

private String jdbcURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffid = request.getParameter("staffid");
        String staffName = request.getParameter("staffName");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT * FROM staff WHERE staffid = ? AND staffName = ? AND password = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, staffid);
            pst.setString(2, staffName);
            pst.setString(3, password);

            rs = pst.executeQuery();

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

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.toString());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
