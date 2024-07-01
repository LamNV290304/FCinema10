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
 *
 * @author Dokkuhai
 */
public class UsersDAO extends DBContext {

//    public void addUser(User user){
//        try {
//            String sql = "Insert Into users(username, password, role, ) ";
//            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
//                pstmt.setString(1, user.getFirstName());
//                pstmt.setString(2, user.getLastName());
//                pstmt.setString(3, user.getEmail());
//                pstmt.setString(4, user.getGender());
//                pstmt.setDate(5, (Date) user.getBeginDate());
//                pstmt.setInt(6, user.getAsignedDepartmentID());
//                pstmt.setInt(7, user.getEmployeeID());
//            }
//
//         catch (Exception e) {
//            System.out.println("Error update category: " + e.getMessage());
//        }
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//    }
    //lấy tất cả các thông tin của User và trả về một danh sách dạng MAP
    public Map<Integer, User> getAllUsers() {
        Map<Integer, User> list = new HashMap<>();
        try {
            String sql = "Select * from users";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setBirthday(rs.getDate("birthday"));
                u.setCity(rs.getNString("city"));
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getNString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setAvatar(rs.getString("avatar"));
                list.put(u.getUser_id(), u);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
//-----------------------------------------------------------------
    public User checkLogin(String username, String password) {
        try {
            UsersDAO uDao = new UsersDAO();
            Map<Integer, User> userlist = uDao.getAllUsers();
            for (Map.Entry<Integer, User> entry : userlist.entrySet()) {
                User user = entry.getValue();
                if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                    return entry.getValue(); // Trả về ID của người dùng nếu tìm thấy
                }
            }

        } catch (Exception e) {
        }
        return null;
    }
//------------------------------------------------------------------------
    public static void main(String[] args) {
        UsersDAO uDao = new UsersDAO();
        Map<Integer, User> list = uDao.getAllUsers();

        for (int id : list.keySet()) {
            System.out.println(list.get(id));
        }
    }
}
