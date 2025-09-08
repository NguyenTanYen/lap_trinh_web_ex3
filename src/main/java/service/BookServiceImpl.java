package service;

import dao.BookDAO;
import dao.BookDAOImpl;
import dto.BookDTO;

import java.math.BigDecimal;
import java.util.List;

public class BookServiceImpl implements BookService {
    private final BookDAO dao = new BookDAOImpl();

    @Override
    public void create(int ownerUserId, String title, String author, String publisher, BigDecimal price) throws Exception {
        validate(title);
        dao.insert(new BookDTO(0, ownerUserId, title.trim(), nz(author), nz(publisher), price));
    }

    @Override
    public void update(int ownerUserId, int id, String title, String author, String publisher, BigDecimal price) throws Exception {
        validate(title);
        BookDTO exist = dao.findById(id, ownerUserId);
        if (exist == null) throw new IllegalArgumentException("Book not found");
        exist.setTitle(title.trim());
        exist.setAuthor(nz(author));
        exist.setPublisher(nz(publisher));
        exist.setPrice(price);
        dao.update(exist);
    }

    @Override
    public void delete(int ownerUserId, int id) throws Exception {
        dao.delete(id, ownerUserId);
    }

    @Override
    public BookDTO getOne(int ownerUserId, int id) throws Exception {
        return dao.findById(id, ownerUserId);
    }

    @Override
    // lấy toàn bộ sách mà user id quản lý
    public List<BookDTO> getAll(int ownerUserId) throws Exception {
        return dao.findAllByUserId(ownerUserId);
    }

    @Override
    public List<BookDTO> search(int ownerUserId, String keyword) throws Exception {
        return dao.search(ownerUserId, keyword);
    }

    private void validate(String title) {
        if (title == null || title.isBlank()) throw new IllegalArgumentException("Title is required");
        if (title.length() > 150) throw new IllegalArgumentException("Title too long");
    }
    private String nz(String s) { return s == null ? "" : s; }
}
