package com.attend.vo;

import com.google.common.collect.Lists;

import java.io.Serializable;
import java.util.List;

/**
 */
public class CalendarChartVO implements Serializable{
    private String name;
    private String type = "bar";
    private List<Integer> data;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Integer> getData() {
        return data;
    }

    public void setData(List<Integer> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "CalendarChartVO{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", data=" + data +
                '}';
    }
}
