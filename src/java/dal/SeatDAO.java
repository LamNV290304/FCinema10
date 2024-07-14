/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import Model.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

/**
 *
 * Date: 12/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Seat
 */
public class SeatDAO extends DBContext {

    //Lấy seat theo ca chiếu và phòng chiếu
    public ArrayList<seat> getListSeatOfRoom(room r, runTime runTime) {
        ArrayList<seat> list = new ArrayList<>();
        RoomDAO loadRoom = new RoomDAO();
        runTimeDAO loadTime = new runTimeDAO();
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from seats where room_id = ? and run_time_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Đặt điều kiện vào where
            ps.setInt(1, r.getRoom_id());
            ps.setInt(2, runTime.getRunTimeId());

            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                //Set các đặc tính vào trong người dùng
                seat s = new seat();
                s.setSeat_id(rs.getInt("seat_id"));
                s.setSeatName(rs.getString("seat_name"));

                room room = loadRoom.getRoomById(rs.getInt("room_id"));
                s.setRoom(room);

                runTime runT = loadTime.getRunTimeById(rs.getInt("run_time_id"));
                s.setRunTime(runT);

                s.setStatus(rs.getBoolean("status"));

                //thêm vào trong danh sách
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list; //trả vè list
    }

    // Tìm ghế dựa vào phòng, thời gian chiếu và ID của ghế
    public seat getSeat(room room, runTime runT, int seatId) {
        seat seat = null;
        RoomDAO roomDAO = new RoomDAO();
        runTimeDAO runTimeDAO = new runTimeDAO();

        try {
            // Câu lệnh SQL để lấy ghế dựa trên room_id, run_time_id và seat_id
            String sql = "SELECT * FROM seats WHERE room_id = ? AND run_time_id = ? AND seat_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            // Đặt các tham số cho PreparedStatement
            ps.setInt(1, room.getRoom_id());
            ps.setInt(2, runT.getRunTimeId());
            ps.setInt(3, seatId);

            // Thực thi truy vấn
            ResultSet rs = ps.executeQuery();

            // Nếu tìm thấy ghế, gán các thông tin vào đối tượng Seat
            if (rs.next()) {
                seat = new seat();
                seat.setSeat_id(rs.getInt("seat_id"));
                seat.setSeatName(rs.getString("seat_name"));

                room fetchedRoom = roomDAO.getRoomById(rs.getInt("room_id"));
                seat.setRoom(fetchedRoom);

                runTime fetchedRunT = runTimeDAO.getRunTimeById(rs.getInt("run_time_id"));
                seat.setRunTime(fetchedRunT);

                seat.setStatus(rs.getBoolean("status"));
            }
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage());
        }

        return seat;
    }

    //Tạo hàm để Update trạng thái của ghế 
    public boolean changeStatusSeat(seat seat) {
        try {
            // Câu lệnh SQL để cập nhật trạng thái của ghế
            String sql = "UPDATE seats SET status = ? WHERE seat_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Đặt các tham số cho PreparedStatement
            ps.setBoolean(1, seat.isStatus());
            ps.setInt(2, seat.getSeat_id());

            // Thực thi câu lệnh cập nhật
            int rowsAffected = ps.executeUpdate();

            // Trả về true nếu cập nhật thành công
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage());
            return false;// Trả về false nếu cập nhật không thành công
        }
    }
    public static void main(String[] args) {
        SeatDAO seDao = new SeatDAO();
        RoomDAO rDao = new RoomDAO();
        runTimeDAO rtDAO = new runTimeDAO();
        runTime runTimeSelect = rtDAO.getRunTimeById(1);
        room r = rDao.getRoomById(11);
        ArrayList<seat> list = seDao.getListSeatOfRoom(r, runTimeSelect);
        System.out.println(list);
    }
}
