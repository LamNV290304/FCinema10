/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.cinemas;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.sql.PreparedStatement;

/**
 *
 * Date: 08/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Cinema
 */
public class CinemasDAO extends DBContext {

    // Lấy hết thông tin phim từ database
    public Map<Integer, cinemas> getAllMovies() {
        Map<Integer, cinemas> listCinema = new HashMap<>();
        try {

            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from cinemas";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

                //Set các đặc tính vào đối tượng
                cinemas cinema = new cinemas();
                cinema.setCinemaID(rs.getInt("cinema_id"));
                cinema.setCinemaName(rs.getString("cinema_name"));
                cinema.setCinemaAddress(rs.getString("cinema_address"));

                //thêm vào trong danh sách
                listCinema.put(cinema.getCinemaID(), cinema);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return listCinema; // trả về danh sách nếu không có lỗi
    }

    // Hàm thêm một rạp chiếu phim
    public boolean addCinema(cinemas cinema) {
        try {
            // Dùng câu lệnh SQL để thêm một rạp chiếu phim
            String sql = "INSERT INTO cinemas (cinema_name, cinema_address) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setNString(1, cinema.getCinemaName());
            ps.setNString(2, cinema.getCinemaAddress());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm cập nhật thông tin rạp chiếu phim
    public boolean updateCinema(cinemas cinema) {
        try {
            // Dùng câu lệnh SQL để cập nhật thông tin rạp chiếu phim
            String sql = "UPDATE cinemas SET cinema_name = ?, cinema_address = ? WHERE cinema_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setNString(1, cinema.getCinemaName());
            ps.setNString(2, cinema.getCinemaAddress());
            ps.setInt(3, cinema.getCinemaID());
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    // Hàm xóa một rạp chiếu phim theo cinema_id
    public boolean deleteCinema(int cinemaId) {
        try {
            // Dùng câu lệnh SQL để xóa một rạp chiếu phim
            String sql = "DELETE FROM cinemas WHERE cinema_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set các tham số vào câu lệnh SQL
            ps.setInt(1, cinemaId);
            // Thực thi câu lệnh SQL và trả về kết quả
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Nếu có lỗi trả về false
        }
    }

    //Hàm tìm rạp theo id
    public cinemas getCinemaById(int id) {
        try {
            // Dùng câu lệnh SQL để lấy thông tin rạp chiếu phim theo id
            String sql = "SELECT * FROM cinemas WHERE cinema_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, id);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cinemas cinema = new cinemas();
                cinema.setCinemaID(rs.getInt("cinema_id"));
                cinema.setCinemaName(rs.getString("cinema_name"));
                cinema.setCinemaAddress(rs.getString("cinema_address"));
                return cinema;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }
}
