/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import Model.schedule;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *  Date: 10/07/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Load Schedule
 */
public class ScheduleDAO extends DBContext{
    
    // Lấy hết thông tin phim từ database
    public ArrayList<schedule> getAllMovies() {
        ArrayList<schedule> list = new ArrayList<>();
        try {

            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from schedule";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                schedule schedule = new schedule();
                //Set các đặc tính vào đối tượng
                

                //thêm vào trong danh sách
                list.add(schedule);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return list; // trả về danh sách nếu không có lỗi
    }
}
