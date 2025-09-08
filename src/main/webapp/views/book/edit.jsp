<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
    <title>Edit Book</title>
    <style>
        :root{
            --bg: linear-gradient(135deg, #6dd5fa, #2980b9, #ffffff);
            --card:#fff; --text:#2c3e50; --muted:#6b7280;
            --primary:#2563eb; --primary-hover:#1e40af;
            --danger:#ef4444; --danger-hover:#b91c1c;
            --border:#e5e7eb; --shadow:0 10px 25px rgba(0,0,0,.15);
            --radius:16px;
        }
        *{box-sizing:border-box}
        body{
            margin:0; font-family:"Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background:var(--bg); min-height:100vh;
            display:flex; justify-content:center; align-items:center; padding:24px;
        }
        .card{
            width:min(520px, 100%); background:var(--card);
            border-radius:var(--radius); box-shadow:var(--shadow);
            padding:30px 26px;
        }
        h2{
            margin:0 0 18px; color:var(--text); font-size:26px; font-weight:800;
            display:flex; align-items:center; gap:10px;
        }
        .hint{ color:var(--muted); font-size:13px; margin:-8px 0 16px }
        label{
            display:block; font-weight:600; color:#334155; margin:10px 0 6px;
        }
        input{
            width:100%; padding:11px 12px; font-size:15px;
            border:1px solid var(--border); border-radius:10px; transition:.25s;
        }
        input:focus{
            border-color:var(--primary); outline:none;
            box-shadow:0 0 0 4px rgba(37,99,235,.15);
        }
        .row{ display:flex; gap:12px; }
        .row > div{ flex:1; }

        .actions{
            display:flex; gap:10px; margin-top:18px; flex-wrap:wrap;
        }
        .btn{
            display:inline-flex; align-items:center; gap:8px;
            padding:11px 16px; border-radius:10px; font-weight:700;
            text-decoration:none; cursor:pointer; border:1px solid transparent;
            transition:.25s; font-size:14px;
        }
        .btn-primary{ background:var(--primary); color:#fff; }
        .btn-primary:hover{ background:var(--primary-hover); }
        .btn-ghost{ background:#fff; border-color:var(--border); color:var(--text); }
        .btn-ghost:hover{ border-color:#cbd5e1; }
        .req{ color:#ef4444; }
        .footer-note{ color:var(--muted); font-size:12px; margin-top:6px; }

        .warn{
            background:#fff7ed; border:1px solid #fed7aa; color:#9a3412;
            padding:10px 12px; border-radius:10px; margin-bottom:12px; display:none;
        }
    </style>
    <script>
        // Kiểm tra nhanh trước khi submit (đảm bảo Title có giá trị)
        function validateForm(e){
            const title = document.querySelector('input[name="title"]');
            const alertBox = document.getElementById('alertBox');
            if(!title.value.trim()){
                e.preventDefault();
                alertBox.style.display = 'block';
                alertBox.textContent = 'Title is required.';
                title.focus();
            }
        }
        document.addEventListener('DOMContentLoaded',()=>{
            const form = document.getElementById('editForm');
            form.addEventListener('submit', validateForm);
        });
    </script>
</head>
<body>
<div class="card">
    <h2>✏️ Edit Book</h2>
    <div id="alertBox" class="warn"></div>
    <div class="hint">Chỉnh sửa thông tin sách và nhấn <strong>Save</strong> để lưu.</div>

    <form id="editForm" method="post" action="${ctx}/editbook">
        <input type="hidden" name="id" value="${book.id}"/>

        <label>Title<span class="req">*</span></label>
        <input name="title" value="${book.title}" required placeholder="Eg. Clean Code"/>

        <div class="row">
            <div>
                <label>Author</label>
                <input name="author" value="${book.author}" placeholder="Eg. Robert C. Martin"/>
            </div>
            <div>
                <label>Publisher</label>
                <input name="publisher" value="${book.publisher}" placeholder="Eg. Prentice Hall"/>
            </div>
        </div>

        <label>Price</label>
        <input name="price" type="number" step="0.01" value="${book.price}" placeholder="Eg. 199000"/>

        <div class="actions">
            <button type="submit" class="btn btn-primary">💾 Save</button>
            <a href="${ctx}/listbook" class="btn btn-ghost">← Back</a>
        </div>
        <div class="footer-note">Trường có dấu <span class="req">*</span> là bắt buộc.</div>
    </form>
</div>
</body>
</html>
