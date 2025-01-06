package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.HuodongdiquEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 活动地区
 * 后端返回视图实体辅助类
 */
@TableName("huodongdiqu")
public class HuodongdiquView  extends HuodongdiquEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public HuodongdiquView(){
	}
 
 	public HuodongdiquView(HuodongdiquEntity huodongdiquEntity){
 	try {
			BeanUtils.copyProperties(this, huodongdiquEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
