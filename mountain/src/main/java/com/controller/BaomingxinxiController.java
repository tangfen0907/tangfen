package com.controller;


import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.BaomingxinxiEntity;
import com.entity.view.BaomingxinxiView;
import com.service.BaomingxinxiService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;

@RequestMapping("baomingxinxi")
@RestController
public class BaomingxinxiController{

    @Autowired
    private BaomingxinxiService baomingxinxiService;

    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, BaomingxinxiEntity baomingxinxi,
                  HttpServletRequest request){
        EntityWrapper<BaomingxinxiEntity> ew = new EntityWrapper<BaomingxinxiEntity>();

        PageUtils page = baomingxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, baomingxinxi), params), params));

        return R.ok().put("data", page);
    }

    /**
     * 前台列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,BaomingxinxiEntity baomingxinxi,
                  HttpServletRequest request){
        EntityWrapper<BaomingxinxiEntity> ew = new EntityWrapper<BaomingxinxiEntity>();
        PageUtils page = baomingxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, baomingxinxi), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BaomingxinxiEntity baomingxinxi){
        EntityWrapper<BaomingxinxiEntity> ew = new EntityWrapper<BaomingxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre( baomingxinxi, "baomingxinxi"));
        return R.ok().put("data", baomingxinxiService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BaomingxinxiEntity baomingxinxi){
        EntityWrapper< BaomingxinxiEntity> ew = new EntityWrapper< BaomingxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre( baomingxinxi, "baomingxinxi"));
        BaomingxinxiView baomingxinxiView =  baomingxinxiService.selectView(ew);
        return R.ok("查询用户发布成功").put("data", baomingxinxiView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BaomingxinxiEntity baomingxinxi = baomingxinxiService.selectById(id);
        return R.ok().put("data", baomingxinxi);
    }

    /**
     * 前台详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BaomingxinxiEntity baomingxinxi = baomingxinxiService.selectById(id);
        return R.ok().put("data", baomingxinxi);
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BaomingxinxiEntity baomingxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(baomingxinxi);
        baomingxinxiService.insert(baomingxinxi);
        return R.ok();
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody BaomingxinxiEntity baomingxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(baomingxinxi);
        if (baomingxinxiService.selectCount(new EntityWrapper<BaomingxinxiEntity>()
                .eq("userid", baomingxinxi.getUserid())
                .eq("activityid", baomingxinxi.getActivityid())) > 0) {
            return R.error("你已经报过名了！");
        }
        baomingxinxiService.insert(baomingxinxi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody BaomingxinxiEntity baomingxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(baomingxinxi);
        baomingxinxiService.updateById(baomingxinxi);//全部更新
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        baomingxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}

