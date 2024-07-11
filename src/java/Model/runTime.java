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
    private Time timeStart;
    private Time timeEnd;
    
    public runTime() {
    }

    public runTime(int runTimeId, Time timeStart, Time timeEnd) {
        this.runTimeId = runTimeId;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public int getRunTimeId() {
        return runTimeId;
    }

    public void setRunTimeId(int runTimeId) {
        this.runTimeId = runTimeId;
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
