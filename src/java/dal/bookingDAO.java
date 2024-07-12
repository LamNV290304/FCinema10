/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dokkuhai
 */
public class bookingDAO extends DBContext{
    
    
    
    
    public ArrayList<Date> getScheduleMovieById(int movieId){
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
    
    public static void main(String[] args) {
        ArrayList<Date> scheList = new ArrayList<>();
    }
}
