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
                runT.setRunTime(rs.getInt("run_time_id"));
                runT.setRunTime(rs.getInt("run_time"));
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

    // Hàm thêm một runtime mới
    public boolean addRunTime(runTime runT) {
        try {
            // Dùng câu lệnh SQL để thêm một runtime vào database
            String sql = "INSERT INTO run_time (run_time, time_start, time_end) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, runT.getRunTime());
            ps.setTime(2, runT.getTimeStart());
            ps.setTime(3, runT.getTimeEnd());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm cập nhật thông tin runtime
    public boolean updateRunTime(runTime runT) {
        try {
            // Dùng câu lệnh SQL để cập nhật thông tin runtime
            String sql = "UPDATE run_time SET run_time = ?, time_start = ?, time_end = ? WHERE run_time_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, runT.getRunTime());
            ps.setTime(2, runT.getTimeStart());
            ps.setTime(3, runT.getTimeEnd());
            ps.setInt(4, runT.getRunTimeId());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm xóa một runtime theo run_time_id
    public boolean deleteRunTime(int runTimeId) {
        try {
            // Dùng câu lệnh SQL để xóa một runtime
            String sql = "DELETE FROM run_time WHERE run_time_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, runTimeId);
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
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
                runT.setRunTime(rs.getInt("run_time"));
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
