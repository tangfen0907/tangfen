package com.entity.view;


import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.BaomingxinxiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 报名信息
 * 后端返回视图实体辅助类
 */
@TableName("baomingxinxi")
public class BaomingxinxiView  extends BaomingxinxiEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public BaomingxinxiView(){
    }

    public BaomingxinxiView(BaomingxinxiEntity baomingxinxiEntity){
        try {
            BeanUtils.copyProperties(this, baomingxinxiEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
