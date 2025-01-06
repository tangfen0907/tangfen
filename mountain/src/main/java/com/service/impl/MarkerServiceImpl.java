package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.MarkerDao;
import com.entity.MarkerEntity;
import com.entity.view.MarkerView;
import com.entity.vo.MarkerVO;
import com.service.MarkerService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("markerService")
public class MarkerServiceImpl extends ServiceImpl<MarkerDao, MarkerEntity> implements MarkerService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<MarkerEntity> page = this.selectPage(
                new Query<MarkerEntity>(params).getPage(),
                new EntityWrapper<MarkerEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<MarkerEntity> wrapper) {
        Page<MarkerView> page =new Query<MarkerView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }


    @Override
    public List<MarkerVO> selectListVO(Wrapper<MarkerEntity> wrapper) {
        return baseMapper.selectListVO(wrapper);
    }

    @Override
    public MarkerVO selectVO(Wrapper<MarkerEntity> wrapper) {
        return baseMapper.selectVO(wrapper);
    }

    @Override
    public List<MarkerView> selectListView(Wrapper<MarkerEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public MarkerView selectView(Wrapper<MarkerEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


    @Override
    public MarkerEntity findByActivityId(Long activityId) {
        return baseMapper.selectByActivityId(activityId);
    }

}
