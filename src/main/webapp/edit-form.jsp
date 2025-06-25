<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String title = "", author = "", date = "", synopsis = "";

    if (id != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String DB_URL = System.getenv("DB_URL");
        String DB_USER = System.getenv("DB_USER");
        String DB_PASSWORD = System.getenv("DB_PASSWORD");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            stmt = conn.prepareStatement("SELECT * FROM book WHERE bookid = ?");
            stmt.setInt(1, Integer.parseInt(id));
            rs = stmt.executeQuery();

            if (rs.next()) {
                title = rs.getString("bookTitle");
                author = rs.getString("bookAuthor");
                date = rs.getString("datePublished");
                synopsis = rs.getString("synopsis");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>


<html>
    <head>
        <title>Edit Book</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container mt-5">
        <h2>Edit Book</h2>
        <form action="EditBookServlet" method="post">
            <input type="hidden" name="bookid" value="<%= id%>" />
            <div class="mb-3">
                <label>Title:</label>
                <input type="text" name="bookTitle" class="form-control" value="<%= title%>" required />
            </div>
            <div class="mb-3">
                <label>Author:</label>
                <input type="text" name="bookAuthor" class="form-control" value="<%= author%>" required />
            </div>
            <div class="mb-3">
                <label>Date Published:</label>
                <input type="date" name="datePublished" class="form-control" value="<%= date%>" required />
            </div>
            <div class="mb-3">
                <label>Synopsis:</label>
                <textarea name="synopsis" class="form-control" required><%= synopsis%></textarea>
            </div>
            <button type="submit" class="btn btn-success">Update Book</button>
            <a href="book-listing.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </body>
</html>
