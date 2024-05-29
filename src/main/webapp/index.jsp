<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<html>
<head>
    <title>Names from MySQL Database</title>
</head>
<body>
    <h2>Names from MySQL Database</h2>
    <%
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to MySQL database
            private static final String url = "jdbc:mysql://db:3306/example_db";
            String username = "root";
            String password = "password";
            Connection conn = DriverManager.getConnection(url, username, password);

            // Execute SQL query to retrieve names
            String sql = "SELECT name FROM names";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Print names
            while (resultSet.next()) {
                out.println(resultSet.getString("name") + "<br>");
            }

            // Close connections
            resultSet.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
