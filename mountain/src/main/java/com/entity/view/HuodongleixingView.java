package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.HuodongleixingEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 活动类型
 * 后端返回视图实体辅助类
 */
@TableName("huodongleixing")
public class HuodongleixingView  extends HuodongleixingEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public HuodongleixingView(){
	}
 
 	public HuodongleixingView(HuodongleixingEntity huodongleixingEntity){
 	try {
			BeanUtils.copyProperties(this, huodongleixingEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
