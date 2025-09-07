package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;

import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private UserService userService = new UserService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newPassword = request.getParameter("password"); // phải khớp với name trong JSP
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("resetEmail") : null;

        if (email == null) {
            request.setAttribute("error", "Phiên đặt lại mật khẩu đã hết hạn. Vui lòng thử lại.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
            rd.forward(request, response);
            return;
        }

        if (newPassword == null || confirmPassword == null || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
            rd.forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
            rd.forward(request, response);
            return;
        }

        // Cập nhật mật khẩu mới
        boolean updated = userService.updatePasswordByEmail(email, newPassword);

        if (updated) {
            // Xóa session resetEmail để tránh reuse
            session.removeAttribute("resetEmail");

            request.setAttribute("message", "Đặt lại mật khẩu thành công. Vui lòng đăng nhập.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("error", "Đặt lại mật khẩu thất bại. Vui lòng thử lại.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/reset-password.jsp");
            rd.forward(request, response);
        }
    }
}
