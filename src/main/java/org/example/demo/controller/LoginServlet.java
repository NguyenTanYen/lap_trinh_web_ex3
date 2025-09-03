package org.example.demo.controller;

import org.example.demo.dao.UserDAO;
import org.example.demo.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User u = userDAO.login(username, password);
        if (u != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", u);
            resp.sendRedirect("home.jsp");
        } else {
            req.setAttribute("error", "Sai username hoặc password!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
