package com.controller;

import com.Model.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

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

        String userid = request.getParameter("userid");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT * FROM users WHERE userid = ? AND password = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, userid);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if (rs.next()) {
                User users = new User();
                users.setUserid(rs.getInt("userid"));
                users.setUsername(rs.getString("username"));
                users.setEmail(rs.getString("email"));
                users.setPassword(rs.getString("password"));
                users.setPhone(rs.getString("phone"));
                users.setAddress(rs.getString("address"));

                HttpSession session = request.getSession();
                session.setAttribute("user", users); // OR
                Object staff = null;
                session.setAttribute("staff", staff);

                response.sendRedirect("Homepage2.jsp");

            } else {
                response.sendRedirect("login.jsp?error=Invalid credentials.");
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
