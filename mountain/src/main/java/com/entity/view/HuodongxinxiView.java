package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.HuodongxinxiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 活动信息
 * 后端返回视图实体辅助类
 */
@TableName("huodongxinxi")
public class HuodongxinxiView  extends HuodongxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public HuodongxinxiView(){
	}
 
 	public HuodongxinxiView(HuodongxinxiEntity huodongxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, huodongxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
