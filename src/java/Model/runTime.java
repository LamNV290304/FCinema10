/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////////////Cần sửa gấp////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model run time
 */
public class runTime {
    private int runTimeId;
    private schedule scheduleId;
    private movies movieId;
    private int runTime;

    public runTime() {
    }

    public runTime(int runTimeId, schedule scheduleId, movies movieId, int runTime) {
        this.runTimeId = runTimeId;
        this.scheduleId = scheduleId;
        this.movieId = movieId;
        this.runTime = runTime;
    }

    public int getRunTimeId() {
        return runTimeId;
    }

    public void setRunTimeId(int runTimeId) {
        this.runTimeId = runTimeId;
    }

    public schedule getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(schedule scheduleId) {
        this.scheduleId = scheduleId;
    }

    public movies getMovieId() {
        return movieId;
    }

    public void setMovieId(movies movieId) {
        this.movieId = movieId;
    }

    public int getRunTime() {
        return runTime;
    }

    public void setRunTime(int runTime) {
        this.runTime = runTime;
    }
    
    
}
