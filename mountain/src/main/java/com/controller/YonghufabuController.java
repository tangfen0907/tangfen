package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.YonghufabuEntity;
import com.entity.view.YonghufabuView;
import com.service.StoreupService;
import com.service.YonghufabuService;
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
 * 用户发布
 * 后端接口
 */
@RestController
@RequestMapping("/yonghufabu")
public class YonghufabuController {
    @Autowired
    private YonghufabuService yonghufabuService;

    @Autowired
    private StoreupService storeupService;

    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,YonghufabuEntity yonghufabu,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			yonghufabu.setYonghuming((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<YonghufabuEntity> ew = new EntityWrapper<YonghufabuEntity>();

		PageUtils page = yonghufabuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yonghufabu), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,YonghufabuEntity yonghufabu, 
		HttpServletRequest request){
        EntityWrapper<YonghufabuEntity> ew = new EntityWrapper<YonghufabuEntity>();

		PageUtils page = yonghufabuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yonghufabu), params), params));
        return R.ok().put("data", page);
    }
	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( YonghufabuEntity yonghufabu){
       	EntityWrapper<YonghufabuEntity> ew = new EntityWrapper<YonghufabuEntity>();
      	ew.allEq(MPUtil.allEQMapPre( yonghufabu, "yonghufabu")); 
        return R.ok().put("data", yonghufabuService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(YonghufabuEntity yonghufabu){
        EntityWrapper< YonghufabuEntity> ew = new EntityWrapper< YonghufabuEntity>();
 		ew.allEq(MPUtil.allEQMapPre( yonghufabu, "yonghufabu")); 
		YonghufabuView yonghufabuView =  yonghufabuService.selectView(ew);
		return R.ok("查询用户发布成功").put("data", yonghufabuView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        YonghufabuEntity yonghufabu = yonghufabuService.selectById(id);
        return R.ok().put("data", yonghufabu);
    }

    /**
     * 前台详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        YonghufabuEntity yonghufabu = yonghufabuService.selectById(id);
        return R.ok().put("data", yonghufabu);
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody YonghufabuEntity yonghufabu, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(yonghufabu);
        yonghufabuService.insert(yonghufabu);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody YonghufabuEntity yonghufabu, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(yonghufabu);
        yonghufabuService.insert(yonghufabu);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody YonghufabuEntity yonghufabu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yonghufabu);
        yonghufabuService.updateById(yonghufabu);//全部更新
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        yonghufabuService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}
