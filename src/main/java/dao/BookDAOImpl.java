package dao;

import dto.BookDTO;
import util.DBConnection;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {

    @Override
    public void insert(BookDTO b) throws Exception {
        String sql = "INSERT INTO books(user_id, title, author, publisher, price) VALUES(?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, b.getUserId());
            ps.setString(2, b.getTitle());
            ps.setString(3, b.getAuthor());
            ps.setString(4, b.getPublisher());
            if (b.getPrice() != null) {
                ps.setBigDecimal(5, b.getPrice());
            } else {
                ps.setNull(5, Types.DECIMAL);
            }
            ps.executeUpdate();
        }
    }

    @Override
    public void update(BookDTO b) throws Exception {
        String sql = "UPDATE books SET title=?, author=?, publisher=?, price=? WHERE id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPublisher());
            if (b.getPrice() != null) {
                ps.setBigDecimal(4, b.getPrice());
            } else {
                ps.setNull(4, Types.DECIMAL);
            }
            ps.setInt(5, b.getId());
            ps.setInt(6, b.getUserId());
            ps.executeUpdate();
        }
    }

    @Override
    public void delete(int id, int ownerUserId) throws Exception {
        String sql = "DELETE FROM books WHERE id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setInt(2, ownerUserId);
            ps.executeUpdate();
        }
    }

    @Override
    public BookDTO findById(int id, int ownerUserId) throws Exception {
        String sql = "SELECT id, user_id, title, author, publisher, price FROM books WHERE id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setInt(2, ownerUserId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        }
        return null;
    }

    @Override
    // lấy thông tin books theo user id
    public List<BookDTO> findAllByUserId(int ownerUserId) throws Exception {
        String sql = "SELECT id, user_id, title, author, publisher, price FROM books WHERE user_id=? ORDER BY id DESC";
        List<BookDTO> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, ownerUserId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        }
        return list;
    }

    @Override
    public List<BookDTO> search(int ownerUserId, String keyword) throws Exception {
        String sql = "SELECT id, user_id, title, author, publisher, price FROM books " +
                "WHERE user_id=? AND (title LIKE ? OR author LIKE ? OR publisher LIKE ?) ORDER BY title";
        List<BookDTO> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, ownerUserId);
            String like = "%" + keyword + "%";
            ps.setString(2, like);
            ps.setString(3, like);
            ps.setString(4, like);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        }
        return list;
    }

    private BookDTO map(ResultSet rs) throws SQLException {
        BigDecimal price = rs.getBigDecimal("price"); // an toàn cho DECIMAL
        return new BookDTO(
                rs.getInt("id"),
                rs.getInt("user_id"),
                rs.getString("title"),
                rs.getString("author"),
                rs.getString("publisher"),
                price
        );
    }
}
