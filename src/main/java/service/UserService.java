package service;

import dao.UserDAO;
import dto.UserDTO;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public String login(String username, String password) {
        UserDTO user = userDAO.getUserByUsername(username);
        if (user == null) {
            return "Không tồn tại tài khoản";
        }
        if (!user.getPassword().equals(password)) {
            return "Mật khẩu sai";
        }
        return "SUCCESS";
    }

    public String register(String username, String password, String email) {
        if (userDAO.getUserByUsername(username) != null) {
            return "Tên đăng nhập đã tồn tại";
        }
        if (!email.contains("@")) {
            return "Invalid email";
        }
        boolean inserted = userDAO.insertUser(new UserDTO(username, password, email));
        return inserted ? "SUCCESS" : "Đăng ký thất bại";
    }

    public int getUserIdByUsername(String username) {
        return userDAO.getUserByUsername(username).getId();
    }

    public UserDTO getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }

    public UserDTO findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    public boolean updatePasswordByEmail(String email, String newPassword) {
        try {
            userDAO.updatePasswordByEmail(email, newPassword);
            return true; // nếu không có lỗi thì coi như thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
