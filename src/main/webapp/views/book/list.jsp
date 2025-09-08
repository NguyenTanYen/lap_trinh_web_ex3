<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
    <title>My Books</title>
    <style>
        :root{
            --bg: linear-gradient(135deg, #6dd5fa, #2980b9, #ffffff);
            --card-bg:#fff;
            --text:#2c3e50;
            --muted:#6b7280;
            --primary:#2563eb;
            --primary-hover:#1e40af;
            --success:#22c55e;
            --success-hover:#16a34a;
            --danger:#ef4444;
            --danger-hover:#b91c1c;
            --border:#e5e7eb;
            --shadow:0 10px 25px rgba(0,0,0,.15);
            --radius:16px;
        }
        *{box-sizing:border-box}
        body{
            margin:0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background:var(--bg);
            min-height:100vh;
            display:flex;justify-content:center;align-items:center;
            padding:24px;
        }
        .page{
            width:min(1100px, 100%);
            background:var(--card-bg);
            border-radius:var(--radius);
            box-shadow:var(--shadow);
            padding:28px;
        }
        .header{
            display:flex;justify-content:space-between;align-items:center;gap:12px;
            margin-bottom:18px;
            flex-wrap:wrap;
        }
        .title{
            margin:0;color:var(--text);
            font-size:28px;font-weight:800;letter-spacing:.3px;
        }
        .tools{
            display:flex;gap:10px;align-items:center;flex-wrap:wrap;
        }
        .search{
            display:flex;align-items:center;gap:8px;
            background:#f8fafc;border:1px solid var(--border);
            padding:10px 12px;border-radius:10px;
        }
        .search input{
            border:none;outline:none;background:transparent;
            min-width:260px;font-size:14px;color:var(--text);
        }
        .btn{
            display:inline-flex;align-items:center;gap:8px;
            padding:10px 14px;border-radius:10px;border:1px solid transparent;
            font-weight:700;font-size:14px;text-decoration:none;cursor:pointer;
            transition:.25s;
        }
        .btn-primary{background:var(--primary);color:#fff}
        .btn-primary:hover{background:var(--primary-hover)}
        .btn-success{background:var(--success);color:#fff}
        .btn-success:hover{background:var(--success-hover)}
        .btn-danger{background:var(--danger);color:#fff}
        .btn-danger:hover{background:var(--danger-hover)}
        .btn-outline{background:#fff;border-color:var(--border);color:var(--text)}
        .btn-outline:hover{border-color:#cbd5e1}

        .meta{
            color:var(--muted);font-size:13px;margin:8px 0 16px 2px;
        }

        .table-wrap{
            overflow:auto;border:1px solid var(--border);
            border-radius:12px;
        }
        table{
            width:100%; border-collapse:collapse; min-width:760px;
        }
        thead th{
            background:#f1f5f9; color:#0f172a; text-align:left;
            padding:12px 14px; font-size:14px; letter-spacing:.2px;
            position:sticky; top:0; z-index:1;
        }
        tbody td{
            padding:12px 14px; border-top:1px solid var(--border);
            color:#111827; font-size:14px;
        }
        tbody tr:nth-child(even){background:#fafafa}
        tbody tr:hover{background:#f0f9ff}

        .price{
            font-variant-numeric: tabular-nums;
            font-weight:700;color:#0b5; /* nhẹ nhàng nổi bật */
        }
        .actions{
            display:flex;gap:8px;flex-wrap:wrap;
        }
        .empty{
            text-align:center;color:var(--muted);padding:36px 12px;
        }
        .pill{
            display:inline-flex;align-items:center;gap:6px;
            padding:6px 10px;border-radius:999px;
            background:#eef2ff;color:#3730a3;font-weight:600;font-size:12px;
        }
        @media (max-width:640px){
            .search input{min-width:160px}
            .title{font-size:22px}
        }
    </style>
</head>
<body>
<div class="page">
    <div class="header">
        <h2 class="title">📚 My Books</h2>
        <div class="tools">
            <form class="search" method="get" action="${ctx}/listbook">
                🔎
                <input name="q" placeholder="Search title / author / publisher" value="${param.q}"/>
                <button type="submit" class="btn btn-outline">Search</button>
            </form>
            <a class="btn btn-success" href="${ctx}/addbook">＋ Add Book</a>
        </div>
    </div>

    <!-- Meta info nhỏ: số lượng kết quả / từ khóa -->
    <div class="meta">
        <c:if test="${not empty param.q}">
            Showing results for: <span class="pill">"${fn:escapeXml(param.q)}"</span>
        </c:if>
        <c:if test="${not empty books}">
            &nbsp;•&nbsp; <strong><c:out value="${fn:length(books)}"/></strong> item(s)
        </c:if>
    </div>

    <c:choose>
        <c:when test="${empty books}">
            <div class="empty">
                <c:if test="${empty param.q}">
                    Chưa có sách nào. Hãy bắt đầu với nút <strong>＋ Add Book</strong>.
                </c:if>
                <c:if test="${not empty param.q}">
                    Không tìm thấy kết quả cho "<em><c:out value='${param.q}'/></em>".
                    <div style="margin-top:10px">
                        <a class="btn btn-outline" href="${ctx}/listbook">Clear search</a>
                        <a class="btn btn-success" href="${ctx}/addbook">＋ Add Book</a>
                    </div>
                </c:if>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th style="width:56px">#</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th style="width:140px">Price</th>
                        <th style="width:200px">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${books}" var="b" varStatus="st">
                        <tr>
                            <td><c:out value="${st.index + 1}"/></td>
                            <td><c:out value="${b.title}"/></td>
                            <td><c:out value="${b.author}"/></td>
                            <td><c:out value="${b.publisher}"/></td>
                            <td class="price">
                                <c:choose>
                                    <c:when test="${not empty b.price}">
                                        <fmt:formatNumber value="${b.price}" type="number" minFractionDigits="0" maxFractionDigits="2"/>
                                    </c:when>
                                    <c:otherwise>—</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="actions">
                                    <a class="btn btn-outline" href="${ctx}/editbook?id=${b.id}">✏️ Edit</a>
                                    <a class="btn btn-danger"
                                       href="${ctx}/deletebook?id=${b.id}"
                                       onclick="return confirm('Delete this book?');">🗑️ Delete</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
