<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Submissions - Festalive</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
        }
        .table-responsive {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4">Contact Submissions</h1>

        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th scope="col">Submission ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Message</th>
                        <th scope="col">Submission Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Database connection parameters
                        String url = "jdbc:mysql://192.168.18.245:3306/javadb_168";
                        String dbUser = "javadb_168";
                        String dbPassword = "Sp3cJa5A2k24";

                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection(url, dbUser, dbPassword);
                            stmt = conn.createStatement();

                            // Query to get all contact submissions
                            String sql = "SELECT * FROM contact_submissions";
                            rs = stmt.executeQuery(sql);

                            // Iterate through the result set and display the data
                            while (rs.next()) {
                                int submissionId = rs.getInt("submission_id");
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String subject = rs.getString("subject");
                                String message = rs.getString("message");
                                Timestamp submissionDate = rs.getTimestamp("submission_date");
                    %>
                                <tr>
                                    <td><%= submissionId %></td>
                                    <td><%= name %></td>
                                    <td><%= email %></td>
                                    <td><%= subject %></td>
                                    <td><%= message %></td>
                                    <td><%= submissionDate %></td>
                                </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                    %>
                            <tr>
                                <td colspan="6" class="text-center">Error occurred while fetching data.</td>
                            </tr>
                    <%
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    