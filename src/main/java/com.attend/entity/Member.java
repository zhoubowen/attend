package com.attend.entity;

import org.apache.ibatis.type.Alias;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 会员信息
 * Created by bowen on 2018-02-27 00:20
 */
@Entity
@Table(name = "t_member")
public class Member {
    @Id
    private Integer id;
    private String account;
    private String password;
    private String email;
    private String name;
    private String company;
    private Integer status;
    private Long phone;
    @Column(name="join_schedue")
    private Integer joinSchedue;
    @Column(name = "create_time")
    private Date createTime;
    @Column(name = "update_time")
    private Date updateTime;

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public Integer getJoinSchedue() {
        return joinSchedue;
    }

    public void setJoinSchedue(Integer joinSchedue) {
        this.joinSchedue = joinSchedue;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", company='" + company + '\'' +
                ", status=" + status +
                ", phone=" + phone +
                ", joinSchedue=" + joinSchedue +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
