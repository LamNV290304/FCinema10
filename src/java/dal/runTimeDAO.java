/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.runTime;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * Date: 08/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Runtime
 */
public class runTimeDAO extends DBContext {

    // Lấy hết thông tin phim từ database
    public ArrayList<runTime> getAllRunTime() {
        ArrayList<runTime> list = new ArrayList<>();
        try {

            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from run_time";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                runTime runT = new runTime();
                //Set các đặc tính vào đối tượng
                runT.setRunTimeId(rs.getInt("run_time_id"));
                runT.setTimeStart(rs.getTime("time_start"));
                runT.setTimeEnd(rs.getTime("time_end"));
                //thêm vào trong danh sách
                list.add(runT);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return list; // trả về danh sách nếu không có lỗi
    }


    // Hàm tìm runtime theo id
    public runTime getRunTimeById(int id) {
        try {
            // Dùng câu lệnh SQL để lấy thông tin runtime theo id
            String sql = "SELECT * FROM run_time WHERE run_time_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, id);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                runTime runT = new runTime();
                runT.setRunTimeId(rs.getInt("run_time_id"));
                runT.setTimeStart(rs.getTime("time_start"));
                runT.setTimeEnd(rs.getTime("time_end"));
                return runT;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }
}
