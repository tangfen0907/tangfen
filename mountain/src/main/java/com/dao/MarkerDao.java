package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.MarkerEntity;
import com.entity.view.MarkerView;
import com.entity.vo.MarkerVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MarkerDao extends BaseMapper<MarkerEntity> {

    List<MarkerVO> selectListVO(@Param("ew") Wrapper<MarkerEntity> wrapper);

    MarkerVO selectVO(@Param("ew") Wrapper<MarkerEntity> wrapper);

    List<MarkerView> selectListView(@Param("ew") Wrapper<MarkerEntity> wrapper);

    List<MarkerView> selectListView(Pagination page, @Param("ew") Wrapper<MarkerEntity> wrapper);


    MarkerView selectView(@Param("ew") Wrapper<MarkerEntity> wrapper);


    MarkerEntity selectByActivityId(@Param("activityId") Long activityId);
}
