package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.MarkerEntity;
import com.entity.view.MarkerView;
import com.entity.vo.MarkerVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MarkerService extends IService<MarkerEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<MarkerVO> selectListVO(Wrapper<MarkerEntity> wrapper);

    MarkerVO selectVO(@Param("ew") Wrapper<MarkerEntity> wrapper);

    List<MarkerView> selectListView(Wrapper<MarkerEntity> wrapper);

    MarkerView selectView(@Param("ew") Wrapper<MarkerEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params,Wrapper<MarkerEntity> wrapper);

    MarkerEntity findByActivityId(Long activityId);

}
