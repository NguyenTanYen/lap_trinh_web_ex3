<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Register</title></head>
<body>
<h2>Register</h2>
<form action="register" method="post">
    Username: <input type="text" name="username"/><br/>
    Email: <input type="email" name="email"/><br/>
    Password: <input type="password" name="password"/><br/>
    <button type="submit">Register</button>
</form>
<p style="color:red">${error}</p>
<a href="login">Already have account? Login</a>
</body>
</html>
