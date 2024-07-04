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
    private cinemas cinema;
    private String room_name;

    public room(int room_id, cinemas cinema, String room_name) {
        this.room_id = room_id;
        this.cinema = cinema;
    }

    public room() {
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public cinemas getCinema() {
        return cinema;
    }

    public void setCinema(cinemas cinema) {
        this.cinema = cinema;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    @Override
    public String toString() {
        return "room{" + "room_id=" + room_id + ", cinema_id=" + cinema + ", room_name=" + room_name + '}';
    }
    
}
