/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.*;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * @author Dokkuhai
 */
public class bookingDAO extends DBContext {

    public ArrayList<Date> getScheduleMovieById(int movieId) {
        ArrayList<Date> scheList = new ArrayList<>();
        try {
            // Dùng câu lệnh SQL để lấy list lịch chiếu 
            String sql = "SELECT * from schedule WHERE movie_id = " + movieId;
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

                //Lấy Schedule rồi insert vào list
                Date tmp = rs.getDate("schedule_date");
                //thêm vào trong danh sách
                scheList.add(tmp);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return scheList;
    }

//    public ArrayList<cinemas> findListCinemas(int room_Id){
//        ArrayList<cinemas> scheList = new ArrayList<>();
//    }
//    
    // Tìm booking theo User
    public booking getBookingByUser(User user) {
        booking b = new booking();
        try {
            // Dùng câu lệnh SQL để lấy thông tin runtime theo id
            String sql = "SELECT * FROM booking WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số id vào câu lệnh SQL
            ps.setInt(1, user.getUser_id());
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b.setBookingId(rs.getInt("booking_id"));
                b.setUser(user);
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }

    // Thêm một booking mới vào cơ sở dữ liệu
    public boolean addBooking(booking booking) {
        try {
            // Dùng câu lệnh SQL để thêm một booking mới
            String sql = "INSERT INTO booking (user_id) VALUES (?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set các tham số cho câu lệnh SQL từ đối tượng Booking
            ps.setInt(1, booking.getUser().getUser_id());

            // Thực thi câu lệnh SQL
            int rowsInserted = ps.executeUpdate();

            // Kiểm tra xem có hàng nào được thêm vào hay không
            if (rowsInserted > 0) {
                return true; // Trả về true nếu thêm thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false; // Trả về false nếu có lỗi hoặc không thêm được
    }

    //Tạo hàm xóa booking
    public boolean deleteBooking(int bookingId) {
        try {
            // Dùng câu lệnh SQL để xóa một booking theo booking_id
            String sql = "DELETE FROM booking WHERE booking_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set tham số booking_id vào câu lệnh SQL
            ps.setInt(1, bookingId);

            // Thực thi câu lệnh SQL
            int rowsDeleted = ps.executeUpdate();

            // Kiểm tra xem có hàng nào được xóa hay không
            if (rowsDeleted > 0) {
                return true; // Trả về true nếu xóa thành công
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false; // Trả về false nếu có lỗi hoặc không xóa được
    }

    public booking getBookingById(int bookingId) {
        booking b = null;
        UsersDAO loadUser = new UsersDAO();
        try {
            // Dùng câu lệnh SQL để lấy thông tin booking theo booking_id
            String sql = "SELECT * FROM booking WHERE booking_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            // Set tham số booking_id vào câu lệnh SQL
            ps.setInt(1, bookingId);
            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Tạo đối tượng booking mới và gán các giá trị từ kết quả truy vấn
                b = new booking();
                b.setBookingId(rs.getInt("booking_id"));
                
                User user = loadUser.getUserById(rs.getInt("user_id"));
                b.setUser(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return b; // Trả về đối tượng booking hoặc null nếu không tìm thấy
    }

    public static void main(String[] args) {
        ArrayList<Date> scheList = new ArrayList<>();
    }
}
