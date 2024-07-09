/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.Time;
/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model run time
 */
public class runTime {
    private int runTimeId;
    private movies movieId;
    private int runTime;
    private Time timeStart;
    private Time timeEnd;
    
    public runTime() {
    }

    public runTime(int runTimeId, movies movieId, int runTime, Time timeStart, Time timeEnd) {
        this.runTimeId = runTimeId;
        this.movieId = movieId;
        this.runTime = runTime;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public int getRunTimeId() {
        return runTimeId;
    }

    public void setRunTimeId(int runTimeId) {
        this.runTimeId = runTimeId;
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

    public Time getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Time timeStart) {
        this.timeStart = timeStart;
    }

    public Time getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Time timeEnd) {
        this.timeEnd = timeEnd;
    }

    
}
