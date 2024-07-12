/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model booking 
 */
public class booking {
    private int bookingId;
    private User user;
    private schedule scheduleId;
    private String seatName;
    private room room_id;

    public booking() {
    }

    public booking(int bookingId, User user, schedule scheduleId, String seatName, room room_id) {
        this.bookingId = bookingId;
        this.user = user;
        this.scheduleId = scheduleId;
        this.seatName = seatName;
        this.room_id = room_id;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
