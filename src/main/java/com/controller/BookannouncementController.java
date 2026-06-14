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
import com.utils.UserBasedCollaborativeFiltering;
import com.algorithm.recommend.RecommendAlgorithmFactory;

import com.entity.BookannouncementEntity;
import com.entity.view.BookannouncementView;

import com.service.BookannouncementService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 图书公告
 * 后端接口
 * @author
 * @email
 * @date 2026-05-13 17:46:34
 */
@RestController
@RequestMapping("/bookannouncement")
public class BookannouncementController {
    @Autowired
    private BookannouncementService bookannouncementService;

    @Autowired
    private StoreupService storeupService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookannouncementEntity bookannouncement,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookannouncementEntity> ew = new EntityWrapper<BookannouncementEntity>();


        //查询结果
		PageUtils page = bookannouncementService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookannouncement), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookannouncementEntity bookannouncement,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimestart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimeend,
                @RequestParam(required = false) Double storeupnumstart,
                @RequestParam(required = false) Double storeupnumend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookannouncementEntity> ew = new EntityWrapper<BookannouncementEntity>();
        if(clicktimestart!=null) ew.ge("clicktime", clicktimestart);
        if(clicktimeend!=null) ew.le("clicktime", clicktimeend);
        if(storeupnumstart!=null) ew.ge("storeupnum", storeupnumstart);
        if(storeupnumend!=null) ew.le("storeupnum", storeupnumend);

        //查询结果
		PageUtils page = bookannouncementService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookannouncement), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookannouncementEntity bookannouncement){
       	EntityWrapper<BookannouncementEntity> ew = new EntityWrapper<BookannouncementEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookannouncement, "bookannouncement"));
        return R.ok().put("data", bookannouncementService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookannouncementEntity bookannouncement){
        EntityWrapper< BookannouncementEntity> ew = new EntityWrapper< BookannouncementEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookannouncement, "bookannouncement"));
		BookannouncementView bookannouncementView =  bookannouncementService.selectView(ew);
		return R.ok("查询图书公告成功").put("data", bookannouncementView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookannouncementEntity bookannouncement = bookannouncementService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookannouncement,deSens);
        return R.ok().put("data", bookannouncement);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookannouncementEntity bookannouncement = bookannouncementService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookannouncement,deSens);
        return R.ok().put("data", bookannouncement);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书公告")
    public R save(@RequestBody BookannouncementEntity bookannouncement, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookannouncement);
        bookannouncementService.insert(bookannouncement);
        return R.ok().put("data",bookannouncement.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书公告")
    @RequestMapping("/add")
    public R add(@RequestBody BookannouncementEntity bookannouncement, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookannouncement);
        bookannouncementService.insert(bookannouncement);
        return R.ok().put("data",bookannouncement.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改图书公告")
    public R update(@RequestBody BookannouncementEntity bookannouncement, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookannouncement);
        //全部更新
        bookannouncementService.updateById(bookannouncement);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书公告")
    public R delete(@RequestBody Long[] ids){
        bookannouncementService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,BookannouncementEntity bookannouncement, HttpServletRequest request,String pre){
        EntityWrapper<BookannouncementEntity> ew = new EntityWrapper<BookannouncementEntity>();
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

		PageUtils page = bookannouncementService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookannouncement), params), params));
        return R.ok().put("data", page);
    }



    /**
     * 随机森林推荐算法
     */
    @RequestMapping("/recommend")
    public R recommend(@RequestParam Map<String, Object> params,BookannouncementEntity bookannouncement, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        Integer limit = params.get("limit") == null ? 10 : Integer.parseInt(params.get("limit").toString());

        // 使用随机森林模型进行推荐
        List<Long> recommendations = new ArrayList<>();
        try{
            RecommendAlgorithmFactory.ModelLoader modelLoader = RecommendAlgorithmFactory.loadModel("bookannouncement.model");
            // 使用随机森林模型预测
            recommendations = modelLoader.recommendItems(Long.parseLong(userId), limit, false, true);
        } catch (Exception e) {
            System.out.println("模型加载失败: " + e.getMessage());
        }
        // 输出推荐结果
        System.out.println("Recommendations for " + userId + ":");
        recommendations.forEach(recommendation -> System.out.println(recommendation));
        EntityWrapper<BookannouncementEntity> ew = new EntityWrapper<BookannouncementEntity>();

        if(recommendations!=null && recommendations.size()>0) {
            ew.in("id", recommendations);
            ew.last("order by FIELD(id, "+String.join(",", recommendations.stream().map(String::valueOf).collect(Collectors.toList()))+")");
        }
        // 根据结果查询结果并返回
        PageUtils page = bookannouncementService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookannouncement), params), params));
        List<BookannouncementEntity> pageList = (List<BookannouncementEntity>)page.getList();
        if(recommendations!=null && recommendations.size()>0 && pageList.size()<limit) {
            int toAddNum = limit-pageList.size();
            ew = new EntityWrapper<BookannouncementEntity>();
            ew.notIn("id", recommendations);
            ew.orderBy("storeupnum", false);
            ew.last("limit "+toAddNum);
            pageList.addAll(bookannouncementService.selectList(ew));
        } else if(pageList.size()>limit) {
            pageList = pageList.subList(0, limit);
        }
        page.setList(pageList);
        return R.ok().put("data", page);
    }






}
