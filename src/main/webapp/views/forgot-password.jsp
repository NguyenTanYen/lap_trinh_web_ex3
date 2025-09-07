<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Quên mật khẩu</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #2980b9, #6dd5fa, #ffffff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .forgot-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 380px;
            text-align: center;
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }
        label {
            font-weight: 600;
            display: block;
            text-align: left;
            margin-bottom: 8px;
            color: #34495e;
        }
        input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: 0.3s;
        }
        input[type="email"]:focus {
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
            margin-top: 15px;
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
<div class="forgot-container">
    <h2>Quên mật khẩu</h2>

    <form action="forgot-password" method="post">
        <label>Nhập email của bạn:</label>
        <input type="email" name="email" required/>
        <button type="submit">Tiếp tục</button>
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
