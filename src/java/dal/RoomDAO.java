/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.cinemas;
import Model.room;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * Date: 10/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Room
 */
public class RoomDAO extends DBContext {

    // Lấy hết thông tin phim từ database
    public ArrayList<room> getAllRoom() {
        ArrayList<room> list = new ArrayList<>();
        CinemasDAO loadCinema = new CinemasDAO();
        try {

            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from room";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

                //Set các đặc tính vào đối tượng
                room room = new room();
                room.setRoom_id(rs.getInt("room_id"));

                cinemas cinema = loadCinema.getCinemaById(rs.getInt("cinema_id"));
                room.setCinema(cinema);

                room.setRoom_name(rs.getString("room_name"));

                //thêm vào trong danh sách
                list.add(room);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return list; // trả về danh sách nếu không có lỗi
    }

    // Hàm cập nhật thông tin phòng chiếu phim
    public boolean updateRoom(room room) {
        try {
            // Dùng câu lệnh SQL để cập nhật thông tin phòng chiếu phim
            String sql = "UPDATE room SET cinema_id = ?, room_name = ? WHERE room_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, room.getCinema().getCinemaID());
            ps.setString(2, room.getRoom_name());
            ps.setInt(3, room.getRoom_id());

            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm xóa một phòng chiếu phim theo room_id
    public boolean deleteRoom(int roomId) {
        try {
            // Dùng câu lệnh SQL để xóa một phòng chiếu phim
            String sql = "DELETE FROM room WHERE room_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, roomId);

            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    //Tìm phòng theo id
    public room getRoomById(int id) {
        CinemasDAO loadCinema = new CinemasDAO();
        try {
            // Dùng câu lệnh SQL để lấy thông tin phòng chiếu phim theo id
            String sql = "SELECT * FROM room WHERE room_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, id);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                room room = new room();
                room.setRoom_id(rs.getInt("room_id"));

                cinemas cinema = loadCinema.getCinemaById(rs.getInt("cinema_id"));
                room.setCinema(cinema);

                room.setRoom_name(rs.getString("room_name"));
                return room;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }
    
    public static void main(String[] args) {
        RoomDAO rDao = new RoomDAO();
        ArrayList<room> listRoom = rDao.getAllRoom();
        for(room r : listRoom){
            System.out.println(r);
        }
        
    }
    
}
