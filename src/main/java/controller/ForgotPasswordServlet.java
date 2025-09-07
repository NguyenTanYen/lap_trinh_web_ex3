package controller;

import dto.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.UserService;

import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/forgot-password.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        UserDTO user = userService.findByEmail(email);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("resetEmail", email);

            response.sendRedirect("reset-password");
        } else {
            request.setAttribute("error", "Email không tồn tại trong hệ thống!");
            RequestDispatcher rd = request.getRequestDispatcher("/views/forgot-password.jsp");
            rd.forward(request, response);
        }
    }

}
