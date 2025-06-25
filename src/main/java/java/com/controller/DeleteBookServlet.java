package com.controller;

import com.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookidStr = request.getParameter("bookid");
        HttpSession session = request.getSession();
        String errorMsg = null;

        if (bookidStr == null || bookidStr.isEmpty()) {
            errorMsg = "Book ID is missing.";
            System.out.println("[DeleteBookServlet] Missing bookid parameter.");
            // Redirect back with error
            session.setAttribute("deleteError", errorMsg);
            response.sendRedirect("book-listing.jsp");
            return;
        }

        int bookid;
        try {
            bookid = Integer.parseInt(bookidStr);
        } catch (NumberFormatException nfe) {
            errorMsg = "Invalid Book ID format: " + bookidStr;
            System.out.println("[DeleteBookServlet] NumberFormatException: " + nfe.getMessage());
            session.setAttribute("deleteError", errorMsg);
            response.sendRedirect("book-listing.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            // Optional: Delete related borrow records first (if you choose)
            // String deleteBorrowSql = "DELETE FROM borrow WHERE bookid = ?";
            // try (PreparedStatement psBorrow = con.prepareStatement(deleteBorrowSql)) {
            //     psBorrow.setInt(1, bookid);
            //     int delBorrow = psBorrow.executeUpdate();
            //     System.out.println("[DeleteBookServlet] Deleted " + delBorrow + " borrow record(s) for bookid " + bookid);
            // }

            String deleteBookSql = "DELETE FROM book WHERE bookid = ?";
            try (PreparedStatement psBook = con.prepareStatement(deleteBookSql)) {
                psBook.setInt(1, bookid);
                int affectedBook = psBook.executeUpdate();
                System.out.println("[DeleteBookServlet] Attempting ,to delete bookid=" + bookid + "; rows affected: " + affectedBook);
                if (affectedBook == 0) {
                    errorMsg = "No book found with ID " + bookid + " (or it may have already been deleted).";
                }
            }
        } catch (SQLIntegrityConstraintViolationException fkEx) {
            // This happens if FK constraints block deletion
            System.err.println("[DeleteBookServlet] FK constraint violation when deleting bookid=" + bookid + ": " + fkEx.getMessage());
            errorMsg = "Cannot delete book ID " + bookid + " because it is referenced in other records.";
        } catch (SQLException sqlEx) {
            System.err.println("[DeleteBookServlet] SQLException when deleting bookid=" + bookid + ": SQLState=" 
                + sqlEx.getSQLState() + ", ErrorCode=" + sqlEx.getErrorCode() 
                + ", Message=" + sqlEx.getMessage());
            errorMsg = "Database error while deleting book ID " + bookid + ": " + sqlEx.getMessage();
        } catch (Exception e) {
            System.err.println("[DeleteBookServlet] Unexpected error when deleting bookid=" + bookid + ": " + e.getMessage());
            e.printStackTrace();
            errorMsg = "Unexpected error: " + e.getMessage();
        }

        if (errorMsg != null) {
            // Store error message in session (or you could use request attribute + forward)
            session.setAttribute("deleteError", errorMsg);
        } else {
            // Optionally store a success message
            session.setAttribute("deleteSuccess", "Book ID " + bookid + " deleted successfully.");
        }
        // Redirect back to listing page
        response.sendRedirect("book-listing.jsp");
    }
}
//hanis//
//asyiqbusuk