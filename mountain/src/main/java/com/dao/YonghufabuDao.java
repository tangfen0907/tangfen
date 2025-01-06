package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.YonghufabuEntity;
import com.entity.view.YonghufabuView;
import com.entity.vo.YonghufabuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 用户发布
 *
 */
public interface YonghufabuDao extends BaseMapper<YonghufabuEntity> {
	
	List<YonghufabuVO> selectListVO(@Param("ew") Wrapper<YonghufabuEntity> wrapper);
	
	YonghufabuVO selectVO(@Param("ew") Wrapper<YonghufabuEntity> wrapper);
	
	List<YonghufabuView> selectListView(@Param("ew") Wrapper<YonghufabuEntity> wrapper);

	List<YonghufabuView> selectListView(Pagination page,@Param("ew") Wrapper<YonghufabuEntity> wrapper);

	
	YonghufabuView selectView(@Param("ew") Wrapper<YonghufabuEntity> wrapper);
	

}
