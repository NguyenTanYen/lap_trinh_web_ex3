<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="dto.UserDTO" %>
<%
    UserDTO u = (UserDTO) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect("login");
        return;
    }
%>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2980b9, #6dd5fa, #ffffff);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .home-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 400px;
            text-align: center;
        }
        .home-container h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .home-container p {
            font-size: 16px;
            color: #34495e;
            margin-bottom: 25px;
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
            margin: 8px 5px;
        }
        .logout-btn {
            background: #2980b9;
            color: #fff;
        }
        .logout-btn:hover {
            background: #1f6391;
        }
        .book-btn {
            background: #27ae60;
            color: #fff;
        }
        .book-btn:hover {
            background: #1e8449;
        }
    </style>
</head>
<body>
<div class="home-container">
    <h2>Welcome, <%= u.getUsername() %>!</h2>
    <p>Email: <%= u.getEmail() %></p>
    <a class="btn logout-btn" href="login">Logout</a>
    <a class="btn book-btn" href="listbook">Quản lý sách</a>
</div>
</body>
</html>

