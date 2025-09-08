package service;

import dto.BookDTO;
import java.math.BigDecimal;
import java.util.List;

public interface BookService {
    void create(int ownerUserId, String title, String author, String publisher, BigDecimal price) throws Exception;
    void update(int ownerUserId, int id, String title, String author, String publisher, BigDecimal price) throws Exception;
    void delete(int ownerUserId, int id) throws Exception;

    BookDTO getOne(int ownerUserId, int id) throws Exception;
    List<BookDTO> getAll(int ownerUserId) throws Exception;
    List<BookDTO> search(int ownerUserId, String keyword) throws Exception;
}
