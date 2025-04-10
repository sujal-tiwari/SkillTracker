<%@ page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,javax.servlet.annotation.*" %>
<%@ page import="com.dbs.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String subject = request.getParameter("subject");

    String fileName = "";
    String uploadPath = application.getRealPath("") + File.separator + "uploads";

    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdir();

    try {
        // Get uploaded file from request
        Part filePart = request.getPart("resume");
        fileName = new File(filePart.getSubmittedFileName()).getName();

        // Save file
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Store data in DB
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO users (name, email, phone, subject, resume_filename) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setString(4, subject);
        ps.setString(5, fileName);

        int i = ps.executeUpdate();

        if (i > 0) {
%>
            <script>
                alert("Resume uploaded and data stored successfully!");
                window.location.href = "index.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Something went wrong!");
                window.location.href = "index.jsp";
            </script>
<%
        }

        ps.close();
        conn.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
