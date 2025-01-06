package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.MarkerEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

@TableName("marker")
public class MarkerView extends MarkerEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public MarkerView(){
    }

    public MarkerView(MarkerEntity markerEntity){
        try {
            BeanUtils.copyProperties(this, markerEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
