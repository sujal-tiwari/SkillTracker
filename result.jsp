<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Skill Analysis Result</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 40px; }
        h2 { text-align: center; color: #333; }
        .skills { max-width: 400px; margin: 0 auto; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .skills ul { list-style: none; padding: 0; }
        .skills li { background: #6c63ff; color: white; padding: 10px; margin: 8px 0; border-radius: 6px; text-align: center; }
    </style>
</head>
<body>
    <h2>Your Matched Skills</h2>
    <div class="skills">
        <ul>
        <%
            List<String> skills = (List<String>) request.getAttribute("skills");
            if (skills != null && !skills.isEmpty()) {
                for (String skill : skills) {
        %>
            <li><%= skill %></li>
        <%
                }
            } else {
        %>
            <li>No matching skills found in the uploaded resume.</li>
        <%
            }
        %>
        </ul>
    </div>
</body>
</html>
