package org.example.demo.controller;


import org.example.demo.dao.UserDAO;
import org.example.demo.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User u = new User(username, email, password);
        if (userDAO.register(u)) {
            resp.sendRedirect("login");
        } else {
            req.setAttribute("error", "Đăng ký thất bại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}
