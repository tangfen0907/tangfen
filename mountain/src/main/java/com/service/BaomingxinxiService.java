package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.BaomingxinxiEntity;
import com.entity.view.BaomingxinxiView;
import com.entity.vo.BaomingxinxiVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 活动信息
 */
public interface BaomingxinxiService extends IService<BaomingxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<BaomingxinxiVO> selectListVO(Wrapper<BaomingxinxiEntity> wrapper);

    BaomingxinxiVO selectVO(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);

    List<BaomingxinxiView> selectListView(Wrapper<BaomingxinxiEntity> wrapper);

    BaomingxinxiView selectView(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params,Wrapper<BaomingxinxiEntity> wrapper);



}