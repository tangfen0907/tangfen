package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.HuodongleixingEntity;
import com.entity.view.HuodongleixingView;
import com.entity.vo.HuodongleixingVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 活动类型
 *
 */
public interface HuodongleixingService extends IService<HuodongleixingEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<HuodongleixingVO> selectListVO(Wrapper<HuodongleixingEntity> wrapper);
   	
   	HuodongleixingVO selectVO(@Param("ew") Wrapper<HuodongleixingEntity> wrapper);
   	
   	List<HuodongleixingView> selectListView(Wrapper<HuodongleixingEntity> wrapper);
   	
   	HuodongleixingView selectView(@Param("ew") Wrapper<HuodongleixingEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<HuodongleixingEntity> wrapper);

   	

}

