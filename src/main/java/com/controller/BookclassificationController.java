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

import com.entity.BookclassificationEntity;
import com.entity.view.BookclassificationView;

import com.service.BookclassificationService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 图书分类
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
@RestController
@RequestMapping("/bookclassification")
public class BookclassificationController {
    @Autowired
    private BookclassificationService bookclassificationService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookclassificationEntity bookclassification,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookclassificationEntity> ew = new EntityWrapper<BookclassificationEntity>();


        //查询结果
		PageUtils page = bookclassificationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookclassification), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookclassificationEntity bookclassification,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookclassificationEntity> ew = new EntityWrapper<BookclassificationEntity>();

        //查询结果
		PageUtils page = bookclassificationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookclassification), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookclassificationEntity bookclassification){
       	EntityWrapper<BookclassificationEntity> ew = new EntityWrapper<BookclassificationEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookclassification, "bookclassification"));
        return R.ok().put("data", bookclassificationService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookclassificationEntity bookclassification){
        EntityWrapper< BookclassificationEntity> ew = new EntityWrapper< BookclassificationEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookclassification, "bookclassification"));
		BookclassificationView bookclassificationView =  bookclassificationService.selectView(ew);
		return R.ok("查询图书分类成功").put("data", bookclassificationView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookclassificationEntity bookclassification = bookclassificationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookclassification,deSens);
        return R.ok().put("data", bookclassification);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookclassificationEntity bookclassification = bookclassificationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookclassification,deSens);
        return R.ok().put("data", bookclassification);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书分类")
    public R save(@RequestBody BookclassificationEntity bookclassification, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(bookclassificationService.selectCount(new EntityWrapper<BookclassificationEntity>().eq("bookclassification", bookclassification.getBookclassification()))>0) {
            return R.error("图书分类已存在");
        }
        //ValidatorUtils.validateEntity(bookclassification);
        bookclassificationService.insert(bookclassification);
        return R.ok().put("data",bookclassification.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书分类")
    @RequestMapping("/add")
    public R add(@RequestBody BookclassificationEntity bookclassification, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(bookclassificationService.selectCount(new EntityWrapper<BookclassificationEntity>().eq("bookclassification", bookclassification.getBookclassification()))>0) {
            return R.error("图书分类已存在");
        }
        //ValidatorUtils.validateEntity(bookclassification);
        bookclassificationService.insert(bookclassification);
        return R.ok().put("data",bookclassification.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改图书分类")
    public R update(@RequestBody BookclassificationEntity bookclassification, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookclassification);
        //验证字段唯一性，否则返回错误信息
        if(bookclassificationService.selectCount(new EntityWrapper<BookclassificationEntity>().ne("id", bookclassification.getId()).eq("bookclassification", bookclassification.getBookclassification()))>0) {
            return R.error("图书分类已存在");
        }
        //全部更新
        bookclassificationService.updateById(bookclassification);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书分类")
    public R delete(@RequestBody Long[] ids){
        bookclassificationService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }










}
