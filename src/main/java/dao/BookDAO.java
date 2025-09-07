package dao;
import dto.BookDTO;
import java.util.List;
public abstract class BookDAO {
    public abstract void  insert(BookDTO book);
    abstract void update(BookDTO book);
    abstract void delete(int id, int userId);
    abstract BookDTO get(int id);
    abstract List<BookDTO> getAllByUser(int userId);
}
