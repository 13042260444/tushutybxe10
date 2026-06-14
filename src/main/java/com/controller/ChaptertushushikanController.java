package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.*;
import java.lang.*;
import java.math.*;
import com.utils.*;
import com.service.*;
import com.entity.*;
import com.entity.view.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;
import com.annotation.SysLog;

import com.entity.ChaptertushushikanEntity;
import com.entity.view.ChaptertushushikanView;

import com.service.ChaptertushushikanService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 图书试看章节
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
@RestController
@RequestMapping("/chaptertushushikan")
public class ChaptertushushikanController {
    @Autowired
    private ChaptertushushikanService chaptertushushikanService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ChaptertushushikanEntity chaptertushushikan,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ChaptertushushikanEntity> ew = new EntityWrapper<ChaptertushushikanEntity>();


        //查询结果
		PageUtils page = chaptertushushikanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chaptertushushikan), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }


    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ChaptertushushikanEntity chaptertushushikan,
                @RequestParam(required = false) Double chapternumstart,
                @RequestParam(required = false) Double chapternumend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ChaptertushushikanEntity> ew = new EntityWrapper<ChaptertushushikanEntity>();
        if(chapternumstart!=null) ew.ge("chapternum", chapternumstart);
        if(chapternumend!=null) ew.le("chapternum", chapternumend);

        //查询结果
		PageUtils page = chaptertushushikanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chaptertushushikan), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ChaptertushushikanEntity chaptertushushikan){
       	EntityWrapper<ChaptertushushikanEntity> ew = new EntityWrapper<ChaptertushushikanEntity>();
      	ew.allEq(MPUtil.allEQMapPre( chaptertushushikan, "chaptertushushikan"));
        return R.ok().put("data", chaptertushushikanService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ChaptertushushikanEntity chaptertushushikan){
        EntityWrapper< ChaptertushushikanEntity> ew = new EntityWrapper< ChaptertushushikanEntity>();
 		ew.allEq(MPUtil.allEQMapPre( chaptertushushikan, "chaptertushushikan"));
		ChaptertushushikanView chaptertushushikanView =  chaptertushushikanService.selectView(ew);
		return R.ok("查询图书试看章节成功").put("data", chaptertushushikanView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        ChaptertushushikanEntity chaptertushushikan = chaptertushushikanService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(chaptertushushikan,deSens);
        return R.ok().put("data", chaptertushushikan);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        ChaptertushushikanEntity chaptertushushikan = chaptertushushikanService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(chaptertushushikan,deSens);
        return R.ok().put("data", chaptertushushikan);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书试看章节")
    public R save(@RequestBody ChaptertushushikanEntity chaptertushushikan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(chaptertushushikan);
        chaptertushushikanService.insert(chaptertushushikan);
        return R.ok().put("data",chaptertushushikan.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书试看章节")
    @RequestMapping("/add")
    public R add(@RequestBody ChaptertushushikanEntity chaptertushushikan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(chaptertushushikan);
        chaptertushushikanService.insert(chaptertushushikan);
        return R.ok().put("data",chaptertushushikan.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改图书试看章节")
    public R update(@RequestBody ChaptertushushikanEntity chaptertushushikan, HttpServletRequest request){
        //ValidatorUtils.validateEntity(chaptertushushikan);
        //全部更新
        chaptertushushikanService.updateById(chaptertushushikan);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书试看章节")
    public R delete(@RequestBody Long[] ids){
        chaptertushushikanService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }










}
