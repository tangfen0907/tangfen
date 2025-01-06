package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.YonghufabuEntity;
import com.entity.view.YonghufabuView;
import com.entity.vo.YonghufabuVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 用户发布
 *
 */
public interface YonghufabuService extends IService<YonghufabuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YonghufabuVO> selectListVO(Wrapper<YonghufabuEntity> wrapper);
   	
   	YonghufabuVO selectVO(@Param("ew") Wrapper<YonghufabuEntity> wrapper);
   	
   	List<YonghufabuView> selectListView(Wrapper<YonghufabuEntity> wrapper);
   	
   	YonghufabuView selectView(@Param("ew") Wrapper<YonghufabuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YonghufabuEntity> wrapper);

   	

}

