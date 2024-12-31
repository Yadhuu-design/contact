<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student Records</title>
</head>
<body>

<h2>Student Records</h2>

<%
    // JDBC variables
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/java123";  // Change with your DB info
    String dbUser = "root";  // Change with your DB username
    String dbPassword = "";  // Change with your DB password

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish connection
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Create SQL query to fetch student data
        String sql = "SELECT * FROM students";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        // Display student records in a table
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Age</th><th>Major</th><th>Year</th></tr>");

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int age = rs.getInt("age");
            String major = rs.getString("major");
            String year = rs.getString("year");

            out.println("<tr>");
            out.println("<td>" + id + "</td>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + age + "</td>");
            out.println("<td>" + major + "</td>");
            out.println("<td>" + year + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

<br>
<a href="add.jsp">Add New Student</a>

</body>
</html>
