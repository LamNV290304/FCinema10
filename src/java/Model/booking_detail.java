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
    private booking bookingId;
    private schedule scheduleId;
    private room room_id;
    private seat seatId;

    public booking_detail() {
    }

    public booking_detail(booking bookingId, schedule scheduleId, room room_id, seat seatId) {
        this.bookingId = bookingId;
        this.scheduleId = scheduleId;
        this.room_id = room_id;
        this.seatId = seatId;
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

    public room getRoom_id() {
        return room_id;
    }

    public void setRoom_id(room room_id) {
        this.room_id = room_id;
    }

    public seat getSeatId() {
        return seatId;
    }

    public void setSeatId(seat seatId) {
        this.seatId = seatId;
    }

    
}
