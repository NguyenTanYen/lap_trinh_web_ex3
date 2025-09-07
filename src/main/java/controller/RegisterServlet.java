package controller;

import service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher rd = request.getRequestDispatcher("views/register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        String result = userService.register(username, password, email);

        if ("SUCCESS".equals(result)) {
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", result);
            RequestDispatcher rd = request.getRequestDispatcher("views/register.jsp");
            rd.forward(request, response);
        }
    }
}
