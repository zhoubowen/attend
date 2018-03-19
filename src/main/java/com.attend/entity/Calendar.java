package com.attend.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 */
@Table(name = "t_calendar")
@Entity
public class Calendar {

    @Id
    private Integer id;
    @Column(name = "user_id")
    private Integer userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "duty_begin_date")
    private Date dutyBeginDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "duty_end_date")
    private Date dutyEndDate;
    private Integer status;
    @Transient
    private Member member;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getDutyBeginDate() {
        return dutyBeginDate;
    }

    public void setDutyBeginDate(Date dutyBeginDate) {
        this.dutyBeginDate = dutyBeginDate;
    }

    public Date getDutyEndDate() {
        return dutyEndDate;
    }

    public void setDutyEndDate(Date dutyEndDate) {
        this.dutyEndDate = dutyEndDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    public String toString() {
        return "Calendar{" +
                "id=" + id +
                ", userId=" + userId +
                ", dutyBeginDate=" + dutyBeginDate +
                ", dutyEndDate=" + dutyEndDate +
                ", status=" + status +
                '}';
    }
}
