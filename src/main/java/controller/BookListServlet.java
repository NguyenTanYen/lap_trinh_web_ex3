package controller;

import dto.UserDTO;
import dto.BookDTO;
import service.BookService;
import service.BookServiceImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/listbook")
public class BookListServlet extends HttpServlet {
    private final BookService service = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy user đang đăng nhập từ session
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {

            String q = req.getParameter("q");
            List<BookDTO> books = (q != null && !q.isBlank())
                    ? service.search(user.getId(), q.trim())
                    : service.getAll(user.getId());

//             Gửi dữ liệu sang JSP
            req.setAttribute("books", books);
//             Forward về views/book/list.jsp
            req.getRequestDispatcher("views/book/list.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Error loading book list", e);
        }
    }
}
