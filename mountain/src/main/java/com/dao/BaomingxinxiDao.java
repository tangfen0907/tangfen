package com.dao;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.BaomingxinxiEntity;
import com.entity.view.BaomingxinxiView;
import com.entity.vo.BaomingxinxiVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 报名信息
 *
 */
public interface BaomingxinxiDao extends BaseMapper<BaomingxinxiEntity> {

    List<BaomingxinxiVO> selectListVO(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);

    BaomingxinxiVO selectVO(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);

    List<BaomingxinxiView> selectListView(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);

    List<BaomingxinxiView> selectListView(Pagination page, @Param("ew") Wrapper<BaomingxinxiEntity> wrapper);


    BaomingxinxiView selectView(@Param("ew") Wrapper<BaomingxinxiEntity> wrapper);


}
