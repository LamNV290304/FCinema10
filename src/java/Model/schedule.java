/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model schedule
 */
public class schedule {
    private int scheduleId;
    private movies movieId;
    private room roomId;
    private Date scheduleDate;
    private runTime runTime;

    public schedule() {
    }

    public schedule(int scheduleId, movies movieId, room roomId, Date scheduleDate, runTime runTime) {
        this.scheduleId = scheduleId;
        this.movieId = movieId;
        this.roomId = roomId;
        this.scheduleDate = scheduleDate;
        this.runTime = runTime;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public movies getMovieId() {
        return movieId;
    }

    public void setMovieId(movies movieId) {
        this.movieId = movieId;
    }

    public room getRoomId() {
        return roomId;
    }

    public void setRoomId(room roomId) {
        this.roomId = roomId;
    }

    public Date getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(Date scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public runTime getRunTime() {
        return runTime;
    }

    public void setRunTime(runTime runTime) {
        this.runTime = runTime;
    }    
}
