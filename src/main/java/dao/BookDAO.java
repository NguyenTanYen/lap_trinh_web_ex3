package dao;

import dto.BookDTO;
import java.util.List;

public interface BookDAO {
    void insert(BookDTO b) throws Exception;
    void update(BookDTO b) throws Exception;
    void delete(int id, int ownerUserId) throws Exception;

    BookDTO findById(int id, int ownerUserId) throws Exception;
    List<BookDTO> findAllByUserId(int ownerUserId) throws Exception;
    List<BookDTO> search(int ownerUserId, String keyword) throws Exception;
}
