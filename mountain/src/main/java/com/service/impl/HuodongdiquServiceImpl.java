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


import com.dao.HuodongdiquDao;
import com.entity.HuodongdiquEntity;
import com.service.HuodongdiquService;
import com.entity.vo.HuodongdiquVO;
import com.entity.view.HuodongdiquView;

@Service("huodongdiquService")
public class HuodongdiquServiceImpl extends ServiceImpl<HuodongdiquDao, HuodongdiquEntity> implements HuodongdiquService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<HuodongdiquEntity> page = this.selectPage(
                new Query<HuodongdiquEntity>(params).getPage(),
                new EntityWrapper<HuodongdiquEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<HuodongdiquEntity> wrapper) {
		  Page<HuodongdiquView> page =new Query<HuodongdiquView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<HuodongdiquVO> selectListVO(Wrapper<HuodongdiquEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public HuodongdiquVO selectVO(Wrapper<HuodongdiquEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<HuodongdiquView> selectListView(Wrapper<HuodongdiquEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public HuodongdiquView selectView(Wrapper<HuodongdiquEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
