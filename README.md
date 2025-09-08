# Book Manager – Servlet/JSP/JDBC (Bài tập 02 mở rộng)

Quản lý **sách** theo quan hệ **1 User – N Book**, bổ sung **Forgot Password** (token) và **Logout**. Triển khai theo mô hình MVC đơn giản: Servlet (Controller) + JSP (View) + DAO/JDBC (Model).

## Tính năng
- Đăng ký / Đăng nhập (session-based)
- **Logout**: huỷ session, redirect login
- **Forgot Password**: phát sinh token, hết hạn 30 phút, reset 1 lần
- **CRUD Sách** (theo user đang đăng nhập): List, Create, Edit, Delete, Search
