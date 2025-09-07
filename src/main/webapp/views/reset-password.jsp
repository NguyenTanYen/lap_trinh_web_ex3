<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #2980b9, #6dd5fa, #ffffff);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .reset-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 380px;
            text-align: center;
        }
        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }
        .form-group {
            text-align: left;
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
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
            box-shadow: 0 0 5px rgba(41,128,185,0.6);
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
            margin-top: 10px;
        }
        button:hover {
            background: #1f6391;
        }
        .message {
            margin-top: 15px;
            font-size: 14px;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
        .links {
            margin-top: 20px;
            font-size: 14px;
        }
        .links a {
            color: #2980b9;
            text-decoration: none;
            font-weight: 500;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="reset-container">
    <h2>Đặt lại mật khẩu</h2>
    <form action="reset-password" method="post">
        <div class="form-group">
            <label for="password">Mật khẩu mới:</label>
            <input type="password" id="password" name="password" required/>
        </div>

        <div class="form-group">
            <label for="confirmPassword">Xác nhận mật khẩu:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required/>
        </div>

        <button type="submit">Cập nhật mật khẩu</button>
    </form>

    <div class="message">
        <p class="error">${error}</p>
        <p class="success">${message}</p>
    </div>

    <div class="links">
        <a href="login">Quay lại đăng nhập</a>
    </div>
</div>
</body>
</html>
