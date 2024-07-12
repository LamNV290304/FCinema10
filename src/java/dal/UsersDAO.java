/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 * Date: 02/07/2024 Author: Nguyễn Việt Lâm Purpose: Load User
 */
public class UsersDAO extends DBContext {

    // Đăng kí người dùng mới vào trong database
    public boolean addUser(User user) {
        try {
            //dùng câu lệnh sql để update
            String sql = "Insert Into users(username, password, avatar, role, fullname, birthday, gender, email, city, phone) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                //Đặt các giá trị vào vị trí
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getAvatar());
                pstmt.setString(4, user.getRole());
                pstmt.setString(5, user.getFullname());
                pstmt.setDate(6, (Date) user.getBirthday());
                pstmt.setString(7, user.getGender());
                pstmt.setString(8, user.getEmail());
                pstmt.setString(9, user.getCity());
                pstmt.setString(10, user.getPhone());
            } catch (Exception e) {
                System.out.println("Error update category: " + e.getMessage());
                return false; //tất cả các lỗi đều trả về false, không update thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//tất cả các lỗi đều trả về false, không update thành công
        }
        return true;//thực hiện thành công trả về true
    }

    //lấy tất cả các thông tin của User và trả về một danh sách dạng MAP
    public Map<Integer, User> getAllUsers() {
        Map<Integer, User> list = new HashMap<>();
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from users";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                //Set các đặc tính vào trong người dùng
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setBirthday(rs.getDate("birthday"));
                u.setCity(rs.getString("city"));
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getNString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setAvatar(rs.getString("avatar"));

                //thêm vào trong danh sách
                list.put(u.getUser_id(), u);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list; //trả vè list
    }

    // Update người dùng trong datebase
    public boolean updateUser(User user) {
        try {
            //dùng câu lệnh sql để update
            String sql = "UPDATE users SET username = ?, password = ?, avatar = ?, role = ?, fullname = ?, birthday = ?, gender = ?, email = ?, city = ?, phone = ? WHERE user_id = ?";;
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                //Đặt các giá trị vào vị trí
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getAvatar());
                pstmt.setString(4, user.getRole());
                pstmt.setString(5, user.getFullname());
                pstmt.setDate(6, (Date) user.getBirthday());
                pstmt.setString(7, user.getGender());
                pstmt.setString(8, user.getEmail());
                pstmt.setString(9, user.getCity());
                pstmt.setString(10, user.getPhone());
                pstmt.setInt(11, user.getUser_id());
            } catch (Exception e) {
                System.out.println("Error update category: " + e.getMessage());
                return false; //tất cả các lỗi đều trả về false, không update thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//tất cả các lỗi đều trả về false, không update thành công
        }
        return true;//thực hiện thành công trả về true
    }

    //kiểm tra  xem login có hợp lệ hay không
    public User checkLogin(String username, String password) {
        try {
            UsersDAO uDao = new UsersDAO();
            Map<Integer, User> userlist = uDao.getAllUsers();
            for (Map.Entry<Integer, User> entry : userlist.entrySet()) {
                User user = entry.getValue();
                if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                    return entry.getValue(); // Trả về User của người dùng nếu tìm thấy
                }
            }

        } catch (Exception e) {
        }
        return null;
    }

    //Xóa một người dùng
    public boolean deleteUser(User user) {
        try {
            //dùng câu lệnh sql để delete
            String sql = "DELETE FROM users WHERE user_id = ?";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                //Đặt các giá trị vào vị trí
                pstmt.setInt(1, user.getUser_id());
            } catch (Exception e) {
                System.out.println("Error update category: " + e.getMessage());
                return false; //tất cả các lỗi đều trả về false, không update thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//tất cả các lỗi đều trả về false, không update thành công
        }
        return true;//thực hiện thành công trả về true
    }

    //lấy data người dùng theo username
    public User getUserByUsername(String username) {
        try {
            UsersDAO uDao = new UsersDAO();
            Map<Integer, User> userlist = uDao.getAllUsers();
            for (Map.Entry<Integer, User> entry : userlist.entrySet()) {
                User user = entry.getValue();
                if (user.getUsername().equals(username)) {
                    return entry.getValue(); // Trả về User của người dùng nếu tìm thấy
                }
            }

        } catch (Exception e) {
        }
        return null;
    }

    //Tìm User bằng Id
    public User getUserById(int userId) {
        User u = null;
        try {
            // Dùng câu lệnh SQL để lấy thông tin user theo user_id
            String sql = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số user_id vào câu lệnh SQL
            ps.setInt(1, userId);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Tạo đối tượng user mới và gán các giá trị từ kết quả truy vấn
                u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setBirthday(rs.getDate("birthday"));
                u.setCity(rs.getString("city"));
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getNString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setAvatar(rs.getString("avatar"));
                // Gán thêm các thuộc tính khác của user nếu có
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return u; // Trả về đối tượng user hoặc null nếu không tìm thấy
    }

    public static void main(String[] args) {
        UsersDAO uDao = new UsersDAO();
        Map<Integer, User> list = uDao.getAllUsers();

        for (int id : list.keySet()) {
            System.out.println(list.get(id));
        }
    }
}
