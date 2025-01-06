package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.HuodongxinxiEntity;
import com.entity.view.HuodongxinxiView;
import com.entity.vo.HuodongxinxiVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 活动信息
 */
public interface HuodongxinxiService extends IService<HuodongxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<HuodongxinxiVO> selectListVO(Wrapper<HuodongxinxiEntity> wrapper);
   	
   	HuodongxinxiVO selectVO(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);
   	
   	List<HuodongxinxiView> selectListView(Wrapper<HuodongxinxiEntity> wrapper);
   	
   	HuodongxinxiView selectView(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<HuodongxinxiEntity> wrapper);

   	

}

