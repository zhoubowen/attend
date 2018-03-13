package com.attend.entity;

import org.apache.ibatis.type.Alias;

import javax.persistence.*;
import java.util.Date;

/**
 * 招商供求
 * Created by bowen on 2018-02-27 12:49
 */
@Entity
@Table(name = "t_article")
public class Article {
    @Id
    private Integer id;
    private String title;
    private String pic;
    private String content;
    /**
     * 0:待审核，1审核通过，2已删除
     */
    private Integer status;
    /**
     * 0:供求，1:招商投资
     */
    private Integer type;
    /**
     * memberId, 创建人
     */
    @Transient
    private Member member;

    @Column(name = "create_by")
    private Integer createBy;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", pic='" + pic + '\'' +
                ", content='" + content + '\'' +
                ", status=" + status +
                ", type=" + type +
                ", member=" + member +
                ", createBy=" + createBy +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
