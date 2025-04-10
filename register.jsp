<%@ page import="java.sql.*" %>
<%@ page import="com.dbs.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - SkillTracker</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String skill = request.getParameter("skill");

    if (name != null && email != null && phone != null && skill != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO users (name, email, phone, skill) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, skill);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
%>
                <script>
                    alert("Registration successful!");
                    window.location.href = "index.html";
                </script>
<%
            } else {
%>
                <script>
                    alert("Registration failed. Please try again.");
                    window.location.href = "index.html";
                </script>
<%
            }
        } catch (Exception e) {
%>
            <script>
                alert("Error: <%= e.getMessage() %>");
                window.location.href = "index.html";
            </script>
<%
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>

<div class="form-container">
    <form method="post" action="register.jsp">

        <h1>Register Your Skill</h1>
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="text" name="phone" placeholder="Phone Number" required>
        <input type="text" name="skill" placeholder="Your Skill" required>
        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
