package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.YonghufabuEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 用户发布
 * 后端返回视图实体辅助类
 */
@TableName("yonghufabu")
public class YonghufabuView  extends YonghufabuEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YonghufabuView(){
	}
 
 	public YonghufabuView(YonghufabuEntity yonghufabuEntity){
 	try {
			BeanUtils.copyProperties(this, yonghufabuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
