<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2980b9, #6dd5fa, #ffffff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #34495e;
        }
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: 0.3s;
        }
        .form-group input:focus {
            border-color: #2980b9;
            outline: none;
            box-shadow: 0px 0px 5px rgba(41,128,185,0.6);
        }
        button {
            background: #2980b9;
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #1f6391;
        }
        .links {
            margin-top: 20px;
            font-size: 14px;
        }
        .links a {
            color: #2980b9;
            text-decoration: none;
            font-weight: 500;
            margin: 0 5px;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Đăng nhập</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required/>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required/>
        </div>

        <button type="submit">Đăng nhập</button>

        <p class="error">${error}</p>

        <div class="links">
            <a href="register">Đăng ký tài khoản</a> |
            <a href="forgot-password">Quên mật khẩu?</a>
        </div>
    </form>
</div>
</body>
</html>
