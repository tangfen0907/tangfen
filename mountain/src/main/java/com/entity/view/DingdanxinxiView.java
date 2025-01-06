package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.DingdanxinxiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 订单信息
 * 后端返回视图实体辅助类
 */
@TableName("dingdanxinxi")
public class DingdanxinxiView  extends DingdanxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DingdanxinxiView(){
	}
 
 	public DingdanxinxiView(DingdanxinxiEntity dingdanxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, dingdanxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
