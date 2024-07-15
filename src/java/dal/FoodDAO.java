/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import Model.Food;
import java.sql.PreparedStatement;

/**
 * Date: 08/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Food
 */
public class FoodDAO extends DBContext {

    //lấy tất cả các thông tin của User và trả về một danh sách dạng MAP
    public Map<Integer, Food> getAllUsers() {
        Map<Integer, Food> list = new HashMap<>();
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from users";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                //Set các đặc tính vào đối tượng
                Food food = new Food();
                food.setFoodId(rs.getInt("food_id"));
                food.setFoodName(rs.getNString("food_name"));
                food.setDescribe(rs.getNString("describe"));
                food.setQuantity(rs.getInt("quantity"));
                food.setPrice(rs.getInt("price"));

                //thêm vào trong danh sách
                list.put(food.getFoodId(), food);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return list; //trả vè list
    }

    //Hàm update số lượng sản phẩm
    public boolean updateQuantity(Food food, int quantity) {
        try {
            //dùng câu lệnh sql để update
            String sql = "UPDATE Food SET quantity = ? WHERE user_id = ?";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                //Đặt các giá trị vào vị trí
                pstmt.setInt(1, food.getQuantity());
                pstmt.setInt(2, food.getFoodId());
            } catch (Exception e) {
                System.out.println("Error update category: " + e.getMessage());
                return false; //tất cả các lỗi đều trả về false, không update thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//tất cả các lỗi đều trả về false, không update thành công
        }

        return true; //Nếu update thành công trả về true
    }

    //Delete đồ ăn muốn bán 
    public boolean deleteFood(int foodId) {
        try {
            // Dùng câu lệnh SQL để xóa
            String sql = "DELETE FROM Food WHERE food_id = ?";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                // Set id của đồ ăn
                pstmt.setInt(1, foodId);

                // Thực thi
                int affectedRows = pstmt.executeUpdate();
                if (affectedRows == 0) {
                    // Nếu không thực hiện được thì là đồ ăn không tồn tại
                    return false;
                }
            } catch (Exception e) {
                System.out.println("Error deleting food: " + e.getMessage());
                return false; // Return false nếu bất kì lỗi nào
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Return false nếu bất kì lỗi nào
        }

        return true; // Return true nếu thành công 
    }

    // Chức năng tạo một Food
    public boolean createFood(Food food) {
        try {
            // Dùng câu lệnh SQL để insert
            String sql = "INSERT INTO Food (food_name, describe, quantity, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                // Đặt các giá trị vào vị trí tương ứng
                pstmt.setNString(1, food.getFoodName());
                pstmt.setNString(2, food.getDescribe());
                pstmt.setInt(3, food.getQuantity());
                pstmt.setInt(4, food.getPrice());

                // Thực thi lệnh SQL
                int affectedRows = pstmt.executeUpdate();
                if (affectedRows == 0) {
                    // Nếu không insert được, trả về false
                    return false;
                }
            } catch (Exception e) {
                System.out.println("Error creating food: " + e.getMessage());
                return false; // Return false nếu bất kì lỗi nào
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Return false nếu bất kì lỗi nào
        }

        return true; // Return true nếu thành công 
    }
}
