<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.model.User" %>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect("login");
        return;
    }
%>
<html>
<head><title>Home</title></head>
<body>
<h2>Welcome, <%= u.getUsername() %>!</h2>
<p>Email: <%= u.getEmail() %></p>
<a href="login">Logout</a>
</body>
</html>
