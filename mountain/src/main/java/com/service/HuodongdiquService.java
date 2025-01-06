package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.HuodongdiquEntity;
import com.entity.view.HuodongdiquView;
import com.entity.vo.HuodongdiquVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 活动地区
 *
 */
public interface HuodongdiquService extends IService<HuodongdiquEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<HuodongdiquVO> selectListVO(Wrapper<HuodongdiquEntity> wrapper);
   	
   	HuodongdiquVO selectVO(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);
   	
   	List<HuodongdiquView> selectListView(Wrapper<HuodongdiquEntity> wrapper);
   	
   	HuodongdiquView selectView(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<HuodongdiquEntity> wrapper);

   	

}

