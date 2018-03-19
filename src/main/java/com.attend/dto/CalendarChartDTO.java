package com.attend.dto;

import java.util.List;

/**
 */
public class CalendarChartDTO {
    private String name;
    private String status;
    private int days;
    private String month;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "CalendarChartDTO{" +
                "name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", days=" + days +
                ", month='" + month + '\'' +
                '}';
    }
}
