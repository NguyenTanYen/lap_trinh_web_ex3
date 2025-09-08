package controller;

import dto.UserDTO;
import service.BookService;
import service.BookServiceImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(urlPatterns = "/deletebook")
public class BookDeleteServlet extends HttpServlet {
    private final BookService service = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        if (user == null) { resp.sendRedirect(req.getContextPath()+"/login"); return; }

        int id = Integer.parseInt(req.getParameter("id"));
        try {
            service.delete(user.getId(), id);
            resp.sendRedirect(req.getContextPath()+"/listbook");
        } catch (Exception e) { throw new ServletException(e); }
    }
}
