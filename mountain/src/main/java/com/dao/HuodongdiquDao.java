package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.HuodongdiquEntity;
import com.entity.view.HuodongdiquView;
import com.entity.vo.HuodongdiquVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 活动地区
 *
 */
public interface HuodongdiquDao extends BaseMapper<HuodongdiquEntity> {
	
	List<HuodongdiquVO> selectListVO(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);
	
	HuodongdiquVO selectVO(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);
	
	List<HuodongdiquView> selectListView(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);

	List<HuodongdiquView> selectListView(Pagination page,@Param("ew") Wrapper<HuodongdiquEntity> wrapper);

	
	HuodongdiquView selectView(@Param("ew") Wrapper<HuodongdiquEntity> wrapper);
	

}
