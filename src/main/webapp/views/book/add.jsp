<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6dd5fa, #2980b9, #ffffff);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background: #fff;
            padding: 35px 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 400px;
        }
        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        label {
            font-weight: 600;
            color: #34495e;
            display: block;
            margin-bottom: 6px;
        }
        input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 18px;
            transition: 0.3s;
        }
        input:focus {
            border-color: #2980b9;
            outline: none;
            box-shadow: 0 0 5px rgba(41, 128, 185, 0.4);
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: 0.3s;
            margin-right: 10px;
        }
        .btn-create {
            background: #27ae60;
            color: #fff;
            border: none;
        }
        .btn-create:hover {
            background: #1e8449;
        }
        .btn-cancel {
            background: #c0392b;
            color: #fff;
            text-decoration: none;
        }
        .btn-cancel:hover {
            background: #922b21;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Book</h2>
    <form method="post">
        <label>Title*</label>
        <input name="title" required/>

        <label>Author</label>
        <input name="author"/>

        <label>Publisher</label>
        <input name="publisher"/>

        <label>Price</label>
        <input name="price" type="number" step="0.01"/>

        <button type="submit" class="btn btn-create">Create</button>
        <a href="${pageContext.request.contextPath}/listbook" class="btn btn-cancel">Cancel</a>
    </form>
</div>
</body>
</html>
