package controller;

import dto.UserDTO;
import service.BookService;
import service.BookServiceImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(urlPatterns = "/addbook")
public class BookAddServlet extends HttpServlet {
    private final BookService service = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) { resp.sendRedirect(req.getContextPath()+"/login"); return; }
        req.getRequestDispatcher("/views/book/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        if (user == null) { resp.sendRedirect(req.getContextPath()+"/login"); return; }
        req.setCharacterEncoding("UTF-8");

        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");

        BigDecimal price = null;
        String priceStr = req.getParameter("price");
        if (priceStr != null && !priceStr.isBlank()) {
            try { price = new BigDecimal(priceStr); } catch (NumberFormatException ignored) {}
        }

        try {
            service.create(user.getId(), title, author, publisher, price);
            resp.sendRedirect(req.getContextPath()+"/listbook");
        } catch (Exception e) { throw new ServletException(e); }
    }
}
