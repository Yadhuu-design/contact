<%
    // Check if form is submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Get form data
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String major = request.getParameter("major");
        String year = request.getParameter("year");

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;
        String url = "jdbc:mysql://localhost:3306/java123";  // Change with your DB info
        String dbUser = "root";  // Change with your DB username
        String dbPassword = "";  // Change with your DB password

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            // Prepare SQL query to insert student data
            String sql = "INSERT INTO students (name, age, major, year) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, major);
            stmt.setString(4, year);

            // Execute the query
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h3>Student record added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add the student record.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>
