/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model seat
 */
public class seat {
    private int seat_id;
    private room room;
    private String seatName;
    private runTime runTime;
    private boolean status;

    public seat() {
    }

    public seat(int seat_id, room room, String seatName, runTime runTime) {
        this.seat_id = seat_id;
        this.room = room;
        this.seatName = seatName;
        this.runTime = runTime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setRoom(room room) {
        this.room = room;
    }

    
    public int getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(int seat_id) {
        this.seat_id = seat_id;
    }

    public room getRoom() {
        return room;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public runTime getRunTime() {
        return runTime;
    }

    public void setRunTime(runTime runTime) {
        this.runTime = runTime;
    }
    
    
    
}
