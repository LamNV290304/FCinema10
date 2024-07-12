/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.schedule;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Statement;
import Model.*;
import java.sql.PreparedStatement;
import java.sql.Date;

/**
 * Date: 10/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Schedule
 */
public class ScheduleDAO extends DBContext {

    // Lấy hết thông tin phim từ database
    public ArrayList<schedule> getAllSchedule() {
        ArrayList<schedule> list = new ArrayList<>();
        MovieDAO loadMovie = new MovieDAO();
        RoomDAO loadRoom = new RoomDAO();
        runTimeDAO loadRunTime = new runTimeDAO();
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from schedule";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                schedule schedule = new schedule();
                //Set các đặc tính vào đối tượng
                schedule.setScheduleId(rs.getInt("schedule_id"));

                movies movie = loadMovie.getMovieById(rs.getInt("movie_id"));
                schedule.setMovieId(movie);

                room room = loadRoom.getRoomById(rs.getInt("room_id"));
                schedule.setRoomId(room);

                schedule.setScheduleDate(rs.getDate("schedule_date"));

                runTime runT = loadRunTime.getRunTimeById(rs.getInt("run_time_id"));
                schedule.setRunTime(runT);
                //thêm vào trong danh sách
                list.add(schedule);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return list; // trả về danh sách nếu không có lỗi
    }

    // Hàm thêm một lịch chiếu mới
    public boolean addSchedule(schedule schedule) {
        try {
            // Dùng câu lệnh SQL để thêm một lịch chiếu vào database
            String sql = "INSERT INTO schedule (movie_id, room_id, schedule_date, run_time_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, schedule.getMovieId().getMovie_id());
            ps.setInt(2, schedule.getRoomId().getRoom_id());
            ps.setDate(3, (Date) schedule.getScheduleDate());
            ps.setInt(4, schedule.getRunTime().getRunTimeId());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm cập nhật thông tin lịch chiếu
    public boolean updateSchedule(schedule schedule) {
        try {
            // Dùng câu lệnh SQL để cập nhật thông tin lịch chiếu
            String sql = "UPDATE schedule SET movie_id = ?, room_id = ?, schedule_date = ?, run_time_id = ? WHERE schedule_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, schedule.getMovieId().getMovie_id());
            ps.setInt(2, schedule.getRoomId().getRoom_id());
            ps.setDate(3, (Date) schedule.getScheduleDate());
            ps.setInt(4, schedule.getRunTime().getRunTimeId());
            ps.setInt(5, schedule.getScheduleId());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm xóa một lịch chiếu theo schedule_id
    public boolean deleteSchedule(int scheduleId) {
        try {
            // Dùng câu lệnh SQL để xóa một lịch chiếu
            String sql = "DELETE FROM schedule WHERE schedule_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, scheduleId);
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    public schedule getScheduleById(int scheduleId) {
        MovieDAO loadMovie = new MovieDAO();
        RoomDAO loadRoom = new RoomDAO();
        runTimeDAO loadRunTime = new runTimeDAO();
        schedule schedule = null;
        try {
            // Dùng câu lệnh SQL để lấy thông tin schedule theo schedule_id
            String sql = "SELECT * FROM schedule WHERE schedule_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số schedule_id vào câu lệnh SQL
            ps.setInt(1, scheduleId);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Tạo đối tượng schedule mới và gán các giá trị từ kết quả truy vấn
                schedule = new schedule();
                schedule.setScheduleId(rs.getInt("schedule_id"));

                movies movie = loadMovie.getMovieById(rs.getInt("movie_id"));
                schedule.setMovieId(movie);

                room room = loadRoom.getRoomById(rs.getInt("room_id"));
                schedule.setRoomId(room);

                schedule.setScheduleDate(rs.getDate("schedule_date"));

                runTime runT = loadRunTime.getRunTimeById(rs.getInt("run_time_id"));
                schedule.setRunTime(runT);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return schedule; // Trả về đối tượng schedule hoặc null nếu không tìm thấy
    }

    public static void main(String[] args) {
        ScheduleDAO sDao = new ScheduleDAO();
        ArrayList<schedule> listSchedule = sDao.getAllSchedule();

        for (schedule r : listSchedule) {
            System.out.println(r);
        }

    }

}
