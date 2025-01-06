package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.YonghufabuDao;
import com.entity.YonghufabuEntity;
import com.service.YonghufabuService;
import com.entity.vo.YonghufabuVO;
import com.entity.view.YonghufabuView;

@Service("yonghufabuService")
public class YonghufabuServiceImpl extends ServiceImpl<YonghufabuDao, YonghufabuEntity> implements YonghufabuService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YonghufabuEntity> page = this.selectPage(
                new Query<YonghufabuEntity>(params).getPage(),
                new EntityWrapper<YonghufabuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YonghufabuEntity> wrapper) {
		  Page<YonghufabuView> page =new Query<YonghufabuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<YonghufabuVO> selectListVO(Wrapper<YonghufabuEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YonghufabuVO selectVO(Wrapper<YonghufabuEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YonghufabuView> selectListView(Wrapper<YonghufabuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YonghufabuView selectView(Wrapper<YonghufabuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
