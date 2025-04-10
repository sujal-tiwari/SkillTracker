<%@ page import="java.sql.*" %>
<%@ page import="com.dbs.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Registered Users – SkillTracker</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .search-bar {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .search-bar button {
            padding: 10px 16px;
            background-color: #6c63ff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .search-bar button:hover {
            background-color: #574fd6;
        }

        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #6c63ff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .download-btn {
            background-color: #6c63ff;
            color: white;
            padding: 6px 14px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: 0.3s ease;
        }

        .download-btn:hover {
            background-color: #574fd6;
            transform: scale(1.05);
        }

        .back-btn {
            display: block;
            text-align: center;
            margin: 30px auto 0;
        }

        .back-btn a {
            text-decoration: none;
            background-color: #6c63ff;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background 0.3s ease;
        }

        .back-btn a:hover {
            background-color: #574fd6;
        }
    </style>
</head>
<body>

<h1>Registered Users</h1>

<div class="search-bar">
    <form method="get" action="view.jsp">
        <input type="text" name="skillSearch" placeholder="Search by skill..."
               value="<%= request.getParameter("skillSearch") != null ? request.getParameter("skillSearch") : "" %>" />
        <button type="submit">🔍 Search</button>
    </form>
</div>

<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Skill</th>
        <th>Resume</th>
    </tr>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql = "";

    try {
        conn = DBConnection.getConnection();
        stmt = conn.createStatement();

        String skillSearch = request.getParameter("skillSearch");
        if (skillSearch != null && !skillSearch.trim().isEmpty()) {
            sql = "SELECT name, email, phone, skill, resume FROM users WHERE skill LIKE '%" + skillSearch + "%'";
        } else {
            sql = "SELECT name, email, phone, skill, resume FROM users";
        }

        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String resume = rs.getString("resume");
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("skill") %></td>
        <td>
            <% if (resume != null && !resume.trim().isEmpty()) { %>
                <a class="download-btn" href="uploads/<%= resume %>" download>📄 Download</a>
            <% } else { %>
                <span style="color: #999;">No File</span>
            <% } %>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
%>
    <tr><td colspan="5">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
</table>

<div class="back-btn">
    <a href="index.jsp">⬅ Back to Home</a>
</div>

</body>
</html>
