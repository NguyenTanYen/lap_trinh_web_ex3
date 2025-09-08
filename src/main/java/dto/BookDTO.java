package dto;

import java.math.BigDecimal;

public class BookDTO {
    private int id;
    private int userId;
    private String title;
    private String author;
    private String publisher;
    private BigDecimal price; // dùng BigDecimal

    public BookDTO() {}

    public BookDTO(int id, int userId, String title, String author, String publisher, BigDecimal price) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.price = price;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
}
