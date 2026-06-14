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

import com.entity.BookpreviewEntity;
import com.entity.view.BookpreviewView;

import com.service.BookpreviewService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 图书试看
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
@RestController
@RequestMapping("/bookpreview")
public class BookpreviewController {
    @Autowired
    private BookpreviewService bookpreviewService;

    @Autowired
    private StoreupService storeupService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookpreviewEntity bookpreview,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookpreviewEntity> ew = new EntityWrapper<BookpreviewEntity>();


        //查询结果
		PageUtils page = bookpreviewService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookpreview), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookpreviewEntity bookpreview,
                @RequestParam(required = false) Double thumbsupnumstart,
                @RequestParam(required = false) Double thumbsupnumend,
                @RequestParam(required = false) Double crazilynumstart,
                @RequestParam(required = false) Double crazilynumend,
                @RequestParam(required = false) Double storeupnumstart,
                @RequestParam(required = false) Double storeupnumend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookpreviewEntity> ew = new EntityWrapper<BookpreviewEntity>();
        if(thumbsupnumstart!=null) ew.ge("thumbsupnum", thumbsupnumstart);
        if(thumbsupnumend!=null) ew.le("thumbsupnum", thumbsupnumend);
        if(crazilynumstart!=null) ew.ge("crazilynum", crazilynumstart);
        if(crazilynumend!=null) ew.le("crazilynum", crazilynumend);
        if(storeupnumstart!=null) ew.ge("storeupnum", storeupnumstart);
        if(storeupnumend!=null) ew.le("storeupnum", storeupnumend);

        //查询结果
		PageUtils page = bookpreviewService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookpreview), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookpreviewEntity bookpreview){
       	EntityWrapper<BookpreviewEntity> ew = new EntityWrapper<BookpreviewEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookpreview, "bookpreview"));
        return R.ok().put("data", bookpreviewService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookpreviewEntity bookpreview){
        EntityWrapper< BookpreviewEntity> ew = new EntityWrapper< BookpreviewEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookpreview, "bookpreview"));
		BookpreviewView bookpreviewView =  bookpreviewService.selectView(ew);
		return R.ok("查询图书试看成功").put("data", bookpreviewView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookpreviewEntity bookpreview = bookpreviewService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookpreview,deSens);
        return R.ok().put("data", bookpreview);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookpreviewEntity bookpreview = bookpreviewService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookpreview,deSens);
        return R.ok().put("data", bookpreview);
    }



    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        BookpreviewEntity bookpreview = bookpreviewService.selectById(id);
        if(type.equals("1")) {
        	bookpreview.setThumbsupnum(bookpreview.getThumbsupnum()+1);
        } else {
        	bookpreview.setCrazilynum(bookpreview.getCrazilynum()+1);
        }
        bookpreviewService.updateById(bookpreview);
        return R.ok("投票成功");
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书试看")
    public R save(@RequestBody BookpreviewEntity bookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookpreview);
        bookpreviewService.insert(bookpreview);
        return R.ok().put("data",bookpreview.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书试看")
    @RequestMapping("/add")
    public R add(@RequestBody BookpreviewEntity bookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookpreview);
        bookpreviewService.insert(bookpreview);
        return R.ok().put("data",bookpreview.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改图书试看")
    public R update(@RequestBody BookpreviewEntity bookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookpreview);
        //全部更新
        bookpreviewService.updateById(bookpreview);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书试看")
    public R delete(@RequestBody Long[] ids){
        bookpreviewService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }










}
