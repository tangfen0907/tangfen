package com.controller;


import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.MarkerEntity;
import com.entity.view.MarkerView;
import com.service.MarkerService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RequestMapping("marker")
@RestController
public class MarkerController{

    @Autowired
    private MarkerService markerService;

    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, MarkerEntity marker,
                  HttpServletRequest request){
        EntityWrapper<MarkerEntity> ew = new EntityWrapper<MarkerEntity>();

        PageUtils page = markerService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, marker), params), params));
        System.out.println("Received marker data: " + page);
        return R.ok().put("data", page);
    }

    /**
     * 前台列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,MarkerEntity marker,
                  HttpServletRequest request){
        EntityWrapper<MarkerEntity> ew = new EntityWrapper<MarkerEntity>();
        PageUtils page = markerService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, marker), params), params));
        // 获取分页数据和相关信息
        long total = page.getTotal();
        int pageSize = page.getPageSize();
        long totalPage = page.getTotalPage();
        int currPage = page.getCurrPage();
        List<?> dataList = page.getList();

        // 打印分页数据和相关信息
        System.out.println("Received marker data: ");
        System.out.println("Total Records: " + total);
        System.out.println("Page Size: " + pageSize);
        System.out.println("Total Pages: " + totalPage);
        System.out.println("Current Page: " + currPage);
        System.out.println("Data List: " + dataList);
        return R.ok().put("data", page);
    }


    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( MarkerEntity marker){
        EntityWrapper<MarkerEntity> ew = new EntityWrapper<MarkerEntity>();
        ew.allEq(MPUtil.allEQMapPre( marker, "marker"));
        return R.ok().put("data", markerService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(MarkerEntity marker){
        EntityWrapper< MarkerEntity> ew = new EntityWrapper< MarkerEntity>();
        ew.allEq(MPUtil.allEQMapPre( marker, "marker"));
        MarkerView markerView =  markerService.selectView(ew);
        return R.ok("查询标注点信息成功").put("data", markerView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        MarkerEntity marker = markerService.selectById(id);
        return R.ok().put("data", marker);
    }

    /**
     * 前台详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        MarkerEntity marker = markerService.selectById(id);
        return R.ok().put("data", marker);
    }

    @RequestMapping("/detailByActivityId/{activity_id}")
    public R detailByActivityId(@PathVariable("activity_id") Long activity_id){
        MarkerEntity marker = markerService.findByActivityId(activity_id);
        return R.ok().put("data", marker);
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MarkerEntity marker, HttpServletRequest request){
        //ValidatorUtils.validateEntity(marker);
        markerService.insert(marker);
        return R.ok();
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody MarkerEntity marker, HttpServletRequest request){
        //ValidatorUtils.validateEntity(marker)
        markerService.insert(marker);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody MarkerEntity marker, HttpServletRequest request){
        //ValidatorUtils.validateEntity(marker);
        markerService.updateById(marker);//全部更新
        // 打印接收到的数据
        System.out.println("Received marker data: " + marker);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        markerService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}

