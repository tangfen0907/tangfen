package com.entity.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class BaomingxinxiVO {
    private static final long serialVersionUID = 1L;

    private Long id;
    /**
     * ID
     */
    private Long userid;
    /**
     * 用户ID
     */
    private String username;
    /**
     * 用户名称
     */
    private String activityname;
    /**
     * 活动名称
     */
    private Long activityid;
    /**
     * 活动ID
     */
    private String status;
    /**
     * 审核状态
     */
    private Long sponsor;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;


    public Date getAddtime() {
        return addtime;
    }
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getActivityid() {
        return activityid;
    }

    public void setActivityid(Long activityid) {
        this.activityid = activityid;;
    }
    public Long getSponsor() {
        return sponsor;
    }

    public void setSponsor(Long sponsor) {
        this.sponsor = sponsor;
    }
}