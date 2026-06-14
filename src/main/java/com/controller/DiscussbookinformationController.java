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

import com.entity.DiscussbookinformationEntity;
import com.entity.view.DiscussbookinformationView;

import com.service.DiscussbookinformationService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 图书信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
@RestController
@RequestMapping("/discussbookinformation")
public class DiscussbookinformationController {
    @Autowired
    private DiscussbookinformationService discussbookinformationService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussbookinformationEntity discussbookinformation,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbookinformationEntity> ew = new EntityWrapper<DiscussbookinformationEntity>();


        //查询结果
		PageUtils page = discussbookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbookinformation), params), params));
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
    public R list(@RequestParam Map<String, Object> params,DiscussbookinformationEntity discussbookinformation,
                @RequestParam(required = false) Double scorestart,
                @RequestParam(required = false) Double scoreend,
                @RequestParam(required = false) Double thumbsupnumstart,
                @RequestParam(required = false) Double thumbsupnumend,
                @RequestParam(required = false) Double crazilynumstart,
                @RequestParam(required = false) Double crazilynumend,
                @RequestParam(required = false) Double istopstart,
                @RequestParam(required = false) Double istopend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbookinformationEntity> ew = new EntityWrapper<DiscussbookinformationEntity>();
        if(scorestart!=null) ew.ge("score", scorestart);
        if(scoreend!=null) ew.le("score", scoreend);
        if(thumbsupnumstart!=null) ew.ge("thumbsupnum", thumbsupnumstart);
        if(thumbsupnumend!=null) ew.le("thumbsupnum", thumbsupnumend);
        if(crazilynumstart!=null) ew.ge("crazilynum", crazilynumstart);
        if(crazilynumend!=null) ew.le("crazilynum", crazilynumend);
        if(istopstart!=null) ew.ge("istop", istopstart);
        if(istopend!=null) ew.le("istop", istopend);

        //查询结果
		PageUtils page = discussbookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbookinformation), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussbookinformationEntity discussbookinformation){
       	EntityWrapper<DiscussbookinformationEntity> ew = new EntityWrapper<DiscussbookinformationEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussbookinformation, "discussbookinformation"));
        return R.ok().put("data", discussbookinformationService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussbookinformationEntity discussbookinformation){
        EntityWrapper< DiscussbookinformationEntity> ew = new EntityWrapper< DiscussbookinformationEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussbookinformation, "discussbookinformation"));
		DiscussbookinformationView discussbookinformationView =  discussbookinformationService.selectView(ew);
		return R.ok("查询图书信息成功").put("data", discussbookinformationView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussbookinformationEntity discussbookinformation = discussbookinformationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbookinformation,deSens);
        return R.ok().put("data", discussbookinformation);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussbookinformationEntity discussbookinformation = discussbookinformationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbookinformation,deSens);
        return R.ok().put("data", discussbookinformation);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书信息")
    public R save(@RequestBody DiscussbookinformationEntity discussbookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbookinformation);
        discussbookinformationService.insert(discussbookinformation);
        return R.ok().put("data",discussbookinformation.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书信息")
    @RequestMapping("/add")
    public R add(@RequestBody DiscussbookinformationEntity discussbookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbookinformation);
        discussbookinformationService.insert(discussbookinformation);
        return R.ok().put("data",discussbookinformation.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        DiscussbookinformationEntity discussbookinformation = discussbookinformationService.selectOne(new EntityWrapper<DiscussbookinformationEntity>().eq("", username));
        return R.ok().put("data", discussbookinformation);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody DiscussbookinformationEntity discussbookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbookinformation);
        //全部更新
        discussbookinformationService.updateById(discussbookinformation);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书信息")
    public R delete(@RequestBody Long[] ids){
        discussbookinformationService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,DiscussbookinformationEntity discussbookinformation, HttpServletRequest request,String pre){
        EntityWrapper<DiscussbookinformationEntity> ew = new EntityWrapper<DiscussbookinformationEntity>();
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

		PageUtils page = discussbookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbookinformation), params), params));
        return R.ok().put("data", page);
    }









}
