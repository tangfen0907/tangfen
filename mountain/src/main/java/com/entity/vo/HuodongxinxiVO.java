package com.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
 

/**
 * 活动信息
 */
public class HuodongxinxiVO  implements Serializable {
	private static final long serialVersionUID = 1L;


	private String userid;
	/**
	 * 活动名称
	 */
	
	private String huodongmingcheng;
		
	/**
	 * 活动类型
	 */
	
	private String huodongleixing;
		
	/**
	 * 活动图片
	 */
	
	private String huodongtupian;
		
	/**
	 * 活动地点
	 */
	
	private String huodongdidian;
		
	/**
	 * 活动时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date huodongshijian;
		
	/**
	 * 活动费用
	 */
	
	private Integer huodongfeiyong;
		
	/**
	 * 费用说明
	 */
	
	private String feiyongshuoming;
		
	/**
	 * 攻略信息
	 */
	
	private String gonglvexinxi;
		
	/**
	 * 活动详情
	 */
	
	private String huodongxiangqing;
		
	/**
	 * 行程安排
	 */
	
	private String xingchenganpai;
		
	/**
	 * 装备要求
	 */
	
	private String zhuangbeiyaoqiu;
		
	/**
	 * 发布日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date faburiqi;
		
	/**
	 * 最近点击时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date clicktime;

	public void setUserid(String userId) {
		this.userid = userId;
	}

	public String getUserid() {
		return userid;
	}
	/**
	 * 设置：活动名称
	 */
	 
	public void setHuodongmingcheng(String huodongmingcheng) {
		this.huodongmingcheng = huodongmingcheng;
	}
	
	/**
	 * 获取：活动名称
	 */
	public String getHuodongmingcheng() {
		return huodongmingcheng;
	}
				
	
	/**
	 * 设置：活动类型
	 */
	 
	public void setHuodongleixing(String huodongleixing) {
		this.huodongleixing = huodongleixing;
	}
	
	/**
	 * 获取：活动类型
	 */
	public String getHuodongleixing() {
		return huodongleixing;
	}
				
	
	/**
	 * 设置：活动图片
	 */
	 
	public void setHuodongtupian(String huodongtupian) {
		this.huodongtupian = huodongtupian;
	}
	
	/**
	 * 获取：活动图片
	 */
	public String getHuodongtupian() {
		return huodongtupian;
	}
				
	
	/**
	 * 设置：活动地点
	 */
	 
	public void setHuodongdidian(String huodongdidian) {
		this.huodongdidian = huodongdidian;
	}
	
	/**
	 * 获取：活动地点
	 */
	public String getHuodongdidian() {
		return huodongdidian;
	}
				
	
	/**
	 * 设置：活动时间
	 */
	 
	public void setHuodongshijian(Date huodongshijian) {
		this.huodongshijian = huodongshijian;
	}
	
	/**
	 * 获取：活动时间
	 */
	public Date getHuodongshijian() {
		return huodongshijian;
	}
				
	
	/**
	 * 设置：活动费用
	 */
	 
	public void setHuodongfeiyong(Integer huodongfeiyong) {
		this.huodongfeiyong = huodongfeiyong;
	}
	
	/**
	 * 获取：活动费用
	 */
	public Integer getHuodongfeiyong() {
		return huodongfeiyong;
	}
				
	
	/**
	 * 设置：费用说明
	 */
	 
	public void setFeiyongshuoming(String feiyongshuoming) {
		this.feiyongshuoming = feiyongshuoming;
	}
	
	/**
	 * 获取：费用说明
	 */
	public String getFeiyongshuoming() {
		return feiyongshuoming;
	}
				
	
	/**
	 * 设置：攻略信息
	 */
	 
	public void setGonglvexinxi(String gonglvexinxi) {
		this.gonglvexinxi = gonglvexinxi;
	}
	
	/**
	 * 获取：攻略信息
	 */
	public String getGonglvexinxi() {
		return gonglvexinxi;
	}
				
	
	/**
	 * 设置：活动详情
	 */
	 
	public void setHuodongxiangqing(String huodongxiangqing) {
		this.huodongxiangqing = huodongxiangqing;
	}
	
	/**
	 * 获取：活动详情
	 */
	public String getHuodongxiangqing() {
		return huodongxiangqing;
	}
				
	
	/**
	 * 设置：行程安排
	 */
	 
	public void setXingchenganpai(String xingchenganpai) {
		this.xingchenganpai = xingchenganpai;
	}
	
	/**
	 * 获取：行程安排
	 */
	public String getXingchenganpai() {
		return xingchenganpai;
	}
				
	
	/**
	 * 设置：装备要求
	 */
	 
	public void setZhuangbeiyaoqiu(String zhuangbeiyaoqiu) {
		this.zhuangbeiyaoqiu = zhuangbeiyaoqiu;
	}
	
	/**
	 * 获取：装备要求
	 */
	public String getZhuangbeiyaoqiu() {
		return zhuangbeiyaoqiu;
	}
				
	
	/**
	 * 设置：发布日期
	 */
	 
	public void setFaburiqi(Date faburiqi) {
		this.faburiqi = faburiqi;
	}
	
	/**
	 * 获取：发布日期
	 */
	public Date getFaburiqi() {
		return faburiqi;
	}
				
	
	/**
	 * 设置：最近点击时间
	 */
	 
	public void setClicktime(Date clicktime) {
		this.clicktime = clicktime;
	}
	
	/**
	 * 获取：最近点击时间
	 */
	public Date getClicktime() {
		return clicktime;
	}
			
}
