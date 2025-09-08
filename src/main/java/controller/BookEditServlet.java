package controller;

import dto.UserDTO;
import dto.BookDTO;
import service.BookService;
import service.BookServiceImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(urlPatterns = "/editbook")
public class BookEditServlet extends HttpServlet {
    private final BookService service = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        if (user == null) { resp.sendRedirect(req.getContextPath()+"/login"); return; }

        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing id");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException ex) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid id");
            return;
        }

        try {
            BookDTO b = service.getOne(user.getId(), id);
            if (b == null) { resp.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            req.setAttribute("book", b);
            req.getRequestDispatcher("/views/book/edit.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        if (user == null) { resp.sendRedirect(req.getContextPath()+"/login"); return; }
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");

        BigDecimal price = null;
        String priceStr = req.getParameter("price");
        if (priceStr != null && !priceStr.isBlank()) {
            try { price = new BigDecimal(priceStr); } catch (NumberFormatException ignored) {}
        }

        try {
            service.update(user.getId(), id, title, author, publisher, price);
            resp.sendRedirect(req.getContextPath()+"/listbook");
        } catch (Exception e) { throw new ServletException(e); }
    }
}
