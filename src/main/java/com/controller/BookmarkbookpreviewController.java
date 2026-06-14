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

import com.entity.BookmarkbookpreviewEntity;
import com.entity.view.BookmarkbookpreviewView;

import com.service.BookmarkbookpreviewService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * bookpreview书签表
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
@RestController
@RequestMapping("/bookmarkbookpreview")
public class BookmarkbookpreviewController {
    @Autowired
    private BookmarkbookpreviewService bookmarkbookpreviewService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookmarkbookpreviewEntity bookmarkbookpreview,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookmarkbookpreviewEntity> ew = new EntityWrapper<BookmarkbookpreviewEntity>();


        //查询结果
		PageUtils page = bookmarkbookpreviewService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookmarkbookpreview), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookmarkbookpreviewEntity bookmarkbookpreview,
                @RequestParam(required = false) Double chapternumstart,
                @RequestParam(required = false) Double chapternumend,
                @RequestParam(required = false) Double progressstart,
                @RequestParam(required = false) Double progressend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookmarkbookpreviewEntity> ew = new EntityWrapper<BookmarkbookpreviewEntity>();
        if(chapternumstart!=null) ew.ge("chapternum", chapternumstart);
        if(chapternumend!=null) ew.le("chapternum", chapternumend);
        if(progressstart!=null) ew.ge("progress", progressstart);
        if(progressend!=null) ew.le("progress", progressend);

        //查询结果
		PageUtils page = bookmarkbookpreviewService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookmarkbookpreview), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookmarkbookpreviewEntity bookmarkbookpreview){
       	EntityWrapper<BookmarkbookpreviewEntity> ew = new EntityWrapper<BookmarkbookpreviewEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookmarkbookpreview, "bookmarkbookpreview"));
        return R.ok().put("data", bookmarkbookpreviewService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookmarkbookpreviewEntity bookmarkbookpreview){
        EntityWrapper< BookmarkbookpreviewEntity> ew = new EntityWrapper< BookmarkbookpreviewEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookmarkbookpreview, "bookmarkbookpreview"));
		BookmarkbookpreviewView bookmarkbookpreviewView =  bookmarkbookpreviewService.selectView(ew);
		return R.ok("查询bookpreview书签表成功").put("data", bookmarkbookpreviewView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookmarkbookpreviewEntity bookmarkbookpreview = bookmarkbookpreviewService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookmarkbookpreview,deSens);
        return R.ok().put("data", bookmarkbookpreview);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookmarkbookpreviewEntity bookmarkbookpreview = bookmarkbookpreviewService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookmarkbookpreview,deSens);
        return R.ok().put("data", bookmarkbookpreview);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增bookpreview书签表")
    public R save(@RequestBody BookmarkbookpreviewEntity bookmarkbookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookmarkbookpreview);
        bookmarkbookpreviewService.insert(bookmarkbookpreview);
        return R.ok().put("data",bookmarkbookpreview.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增bookpreview书签表")
    @RequestMapping("/add")
    public R add(@RequestBody BookmarkbookpreviewEntity bookmarkbookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookmarkbookpreview);
        bookmarkbookpreviewService.insert(bookmarkbookpreview);
        return R.ok().put("data",bookmarkbookpreview.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        BookmarkbookpreviewEntity bookmarkbookpreview = bookmarkbookpreviewService.selectOne(new EntityWrapper<BookmarkbookpreviewEntity>().eq("", username));
        return R.ok().put("data", bookmarkbookpreview);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody BookmarkbookpreviewEntity bookmarkbookpreview, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookmarkbookpreview);
        //全部更新
        bookmarkbookpreviewService.updateById(bookmarkbookpreview);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除bookpreview书签表")
    public R delete(@RequestBody Long[] ids){
        bookmarkbookpreviewService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,BookmarkbookpreviewEntity bookmarkbookpreview, HttpServletRequest request,String pre){
        EntityWrapper<BookmarkbookpreviewEntity> ew = new EntityWrapper<BookmarkbookpreviewEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        // 组装参数
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicktime");
        params.put("order", "desc");

		PageUtils page = bookmarkbookpreviewService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookmarkbookpreview), params), params));
        return R.ok().put("data", page);
    }









}
