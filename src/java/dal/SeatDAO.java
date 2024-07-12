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
    public ArrayList<seat> getListSeatOfRoom(room r, runTime runTime){
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
    
    
}
