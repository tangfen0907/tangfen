package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.HuodongdiquEntity;
import com.entity.view.HuodongdiquView;
import com.service.HuodongdiquService;
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
 * 活动地区
 * 后端接口
 */
@RestController
@RequestMapping("/huodongdiqu")
public class HuodongdiquController {
    @Autowired
    private HuodongdiquService huodongdiquService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,HuodongdiquEntity huodongdiqu,
		HttpServletRequest request){
        EntityWrapper<HuodongdiquEntity> ew = new EntityWrapper<HuodongdiquEntity>();

		PageUtils page = huodongdiquService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huodongdiqu), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,HuodongdiquEntity huodongdiqu, 
		HttpServletRequest request){
        EntityWrapper<HuodongdiquEntity> ew = new EntityWrapper<HuodongdiquEntity>();

		PageUtils page = huodongdiquService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huodongdiqu), params), params));
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( HuodongdiquEntity huodongdiqu){
       	EntityWrapper<HuodongdiquEntity> ew = new EntityWrapper<HuodongdiquEntity>();
      	ew.allEq(MPUtil.allEQMapPre( huodongdiqu, "huodongdiqu")); 
        return R.ok().put("data", huodongdiquService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(HuodongdiquEntity huodongdiqu){
        EntityWrapper< HuodongdiquEntity> ew = new EntityWrapper< HuodongdiquEntity>();
 		ew.allEq(MPUtil.allEQMapPre( huodongdiqu, "huodongdiqu")); 
		HuodongdiquView huodongdiquView =  huodongdiquService.selectView(ew);
		return R.ok("查询活动地区成功").put("data", huodongdiquView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        HuodongdiquEntity huodongdiqu = huodongdiquService.selectById(id);
        return R.ok().put("data", huodongdiqu);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        HuodongdiquEntity huodongdiqu = huodongdiquService.selectById(id);
        return R.ok().put("data", huodongdiqu);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HuodongdiquEntity huodongdiqu, HttpServletRequest request){
        if(huodongdiquService.selectCount(new EntityWrapper<HuodongdiquEntity>().eq("huodongdiqu", huodongdiqu.getHuodongdiqu()))>0) {
            return R.error("活动地区已存在");
        }
    	//ValidatorUtils.validateEntity(huodongdiqu);
        huodongdiquService.insert(huodongdiqu);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody HuodongdiquEntity huodongdiqu, HttpServletRequest request){
        if(huodongdiquService.selectCount(new EntityWrapper<HuodongdiquEntity>().eq("huodongdiqu", huodongdiqu.getHuodongdiqu()))>0) {
            return R.error("活动地区已存在");
        }
    	//ValidatorUtils.validateEntity(huodongdiqu);
        huodongdiquService.insert(huodongdiqu);
        return R.ok();
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody HuodongdiquEntity huodongdiqu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(huodongdiqu);
        if(huodongdiquService.selectCount(new EntityWrapper<HuodongdiquEntity>().ne("id", huodongdiqu.getId()).eq("huodongdiqu", huodongdiqu.getHuodongdiqu()))>0) {
            return R.error("活动地区已存在");
        }
        huodongdiquService.updateById(huodongdiqu);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        huodongdiquService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	










}
