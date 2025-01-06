package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.HuodongxinxiEntity;
import com.entity.view.HuodongxinxiView;
import com.entity.vo.HuodongxinxiVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 活动信息
 *
 */
public interface HuodongxinxiDao extends BaseMapper<HuodongxinxiEntity> {
	
	List<HuodongxinxiVO> selectListVO(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);
	
	HuodongxinxiVO selectVO(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);
	
	List<HuodongxinxiView> selectListView(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);

	List<HuodongxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);

	
	HuodongxinxiView selectView(@Param("ew") Wrapper<HuodongxinxiEntity> wrapper);
	

}
