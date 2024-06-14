/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model room
 */
public class room {
    private int room_id;
    private String cinema_id;
    private String room_name;

    public room(int room_id, String cinema_id, String room_name) {
        this.room_id = room_id;
        this.cinema_id = cinema_id;
    }

    public room() {
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getCinema_id() {
        return cinema_id;
    }

    public void setCinema_id(String cinema_id) {
        this.cinema_id = cinema_id;
    }

    @Override
    public String toString() {
        return "room{" + "room_id=" + room_id + ", cinema_id=" + cinema_id + ", room_name=" + room_name + '}';
    }
    
}
