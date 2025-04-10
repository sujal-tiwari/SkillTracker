<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "admin123".equals(password)) {
        response.sendRedirect("view.jsp");
    } else {
        response.sendRedirect("admin.jsp?error=1");
    }
%>
