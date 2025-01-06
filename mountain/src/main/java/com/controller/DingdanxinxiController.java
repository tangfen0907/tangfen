package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.DingdanxinxiEntity;
import com.entity.view.DingdanxinxiView;
import com.service.DingdanxinxiService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;

/**
 * 订单信息
 * 后端接口
 */
@RestController
@RequestMapping("/dingdanxinxi")
public class DingdanxinxiController {
    @Autowired
    private DingdanxinxiService dingdanxinxiService;

    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DingdanxinxiEntity dingdanxinxi,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			dingdanxinxi.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<DingdanxinxiEntity> ew = new EntityWrapper<DingdanxinxiEntity>();

		PageUtils page = dingdanxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dingdanxinxi), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DingdanxinxiEntity dingdanxinxi, 
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			dingdanxinxi.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<DingdanxinxiEntity> ew = new EntityWrapper<DingdanxinxiEntity>();

		PageUtils page = dingdanxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dingdanxinxi), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DingdanxinxiEntity dingdanxinxi){
       	EntityWrapper<DingdanxinxiEntity> ew = new EntityWrapper<DingdanxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( dingdanxinxi, "dingdanxinxi")); 
        return R.ok().put("data", dingdanxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DingdanxinxiEntity dingdanxinxi){
        EntityWrapper< DingdanxinxiEntity> ew = new EntityWrapper< DingdanxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( dingdanxinxi, "dingdanxinxi")); 
		DingdanxinxiView dingdanxinxiView =  dingdanxinxiService.selectView(ew);
		return R.ok("查询订单信息成功").put("data", dingdanxinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DingdanxinxiEntity dingdanxinxi = dingdanxinxiService.selectById(id);
        return R.ok().put("data", dingdanxinxi);
    }

    /**
     * 前台详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DingdanxinxiEntity dingdanxinxi = dingdanxinxiService.selectById(id);
        return R.ok().put("data", dingdanxinxi);
    }


    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DingdanxinxiEntity dingdanxinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(dingdanxinxi);
        dingdanxinxiService.insert(dingdanxinxi);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DingdanxinxiEntity dingdanxinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(dingdanxinxi);
    	dingdanxinxi.setUserid((Long)request.getSession().getAttribute("userId"));
        dingdanxinxiService.insert(dingdanxinxi);
        return R.ok();
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DingdanxinxiEntity dingdanxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(dingdanxinxi);
        dingdanxinxiService.updateById(dingdanxinxi);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        dingdanxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	










}
