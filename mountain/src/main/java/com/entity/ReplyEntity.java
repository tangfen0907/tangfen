package com.entity;


import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

/**
 * 圈子交流
 */
@TableName("forum")
public class ReplyEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


    public ReplyEntity() {

    }

    public ReplyEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 帖子标题
     */

    private String title;

    /**
     * 帖子内容
     */

    private String content;

    /**
     * 父节点id
     */

    private Long parentid;

    /**
     * 用户id
     */

    private Long userid;

    /**
     * 用户名
     */

    private String username;
    private String useravatar;
    /**
     * 状态
     */

    private String isdone;


    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public Date getAddtime() {
        return addtime;
    }
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @TableField(exist = false)
    private List<ReplyEntity> childs;

    public List<ReplyEntity> getChilds() {
        return childs;
    }

    public void setChilds(List<ReplyEntity> childs) {
        this.childs = childs;
    }
    /**
     * 设置：帖子标题
     */
    public void setTitle(String title) {
        this.title = title;
    }
    /**
     * 获取：帖子标题
     */
    public String getTitle() {
        return title;
    }
    /**
     * 设置：帖子内容
     */
    public void setContent(String content) {
        this.content = content;
    }
    /**
     * 获取：帖子内容
     */
    public String getContent() {
        return content;
    }
    /**
     * 设置：父节点id
     */
    public void setParentid(Long parentid) {
        this.parentid = parentid;
    }
    /**
     * 获取：父节点id
     */
    public Long getParentid() {
        return parentid;
    }
    /**
     * 设置：用户id
     */
    public void setUserid(Long userid) {
        this.userid = userid;
    }
    /**
     * 获取：用户id
     */
    public Long getUserid() {
        return userid;
    }
    /**
     * 设置：用户名
     */

    public void setUsername(String username) {
        this.username = username;
    }
    /**
     * 获取：用户名
     */
    public String getUsername() {
        return username;
    }
    public void setUseravatar(String useravatar) {
        this.useravatar = useravatar;
    }

    public String getUseravatar() {
        return useravatar;
    }
    /**
     * 设置：状态
     */
    public void setIsdone(String isdone) {
        this.isdone = isdone;
    }
    /**
     * 获取：状态
     */
    public String getIsdone() {
        return isdone;
    }

}