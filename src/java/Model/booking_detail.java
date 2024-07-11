/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model booking_detail
 */
public class booking_detail {
    private int bookingDetail;
    private booking bookingId;
    private schedule scheduleId;
    private String seatName;
    private room room_id;

    public booking_detail() {
    }

    public booking_detail(int bookingDetail, booking bookingId, schedule scheduleId, String seatName, room room_id) {
        this.bookingDetail = bookingDetail;
        this.bookingId = bookingId;
        this.scheduleId = scheduleId;
        this.seatName = seatName;
        this.room_id = room_id;
    }

    public int getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(int bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public booking getBookingId() {
        return bookingId;
    }

    public void setBookingId(booking bookingId) {
        this.bookingId = bookingId;
    }

    public schedule getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(schedule scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public room getRoom_id() {
        return room_id;
    }

    public void setRoom_id(room room_id) {
        this.room_id = room_id;
    }

    
}
