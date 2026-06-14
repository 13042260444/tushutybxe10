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
import com.entity.OrdersEntity;
import com.service.OrdersService;
import com.utils.UserBasedCollaborativeFiltering;
import com.algorithm.recommend.RecommendAlgorithmFactory;

import com.entity.BookinformationEntity;
import com.entity.view.BookinformationView;

import com.service.BookinformationService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 图书信息
 * 后端接口
 * @author
 * @email
 * @date 2026-05-13 17:46:33
 */
@RestController
@RequestMapping("/bookinformation")
public class BookinformationController {
    @Autowired
    private BookinformationService bookinformationService;

    @Autowired
    private StoreupService storeupService;

    @Autowired
    private OrdersService ordersService;








    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookinformationEntity bookinformation,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date publicationdatestart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date publicationdateend,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(publicationdatestart!=null) ew.ge("publicationdate", publicationdatestart);
        if(publicationdateend!=null) ew.le("publicationdate", publicationdateend);
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);


        //查询结果
		PageUtils page = bookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformation), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookinformationEntity bookinformation,
                @RequestParam(required = false) Double salesstart,
                @RequestParam(required = false) Double salesend,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date publicationdatestart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date publicationdateend,
                @RequestParam(required = false) Double onelimittimesstart,
                @RequestParam(required = false) Double onelimittimesend,
                @RequestParam(required = false) Double alllimittimesstart,
                @RequestParam(required = false) Double alllimittimesend,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
                @RequestParam(required = false) Double thumbsupnumstart,
                @RequestParam(required = false) Double thumbsupnumend,
                @RequestParam(required = false) Double crazilynumstart,
                @RequestParam(required = false) Double crazilynumend,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimestart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimeend,
                @RequestParam(required = false) Double discussnumstart,
                @RequestParam(required = false) Double discussnumend,
                @RequestParam(required = false) Double totalscorestart,
                @RequestParam(required = false) Double totalscoreend,
                @RequestParam(required = false) Double onshelvesstart,
                @RequestParam(required = false) Double onshelvesend,
                @RequestParam(required = false) Double storeupnumstart,
                @RequestParam(required = false) Double storeupnumend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(salesstart!=null) ew.ge("sales", salesstart);
        if(salesend!=null) ew.le("sales", salesend);
        if(publicationdatestart!=null) ew.ge("publicationdate", publicationdatestart);
        if(publicationdateend!=null) ew.le("publicationdate", publicationdateend);
        if(onelimittimesstart!=null) ew.ge("onelimittimes", onelimittimesstart);
        if(onelimittimesend!=null) ew.le("onelimittimes", onelimittimesend);
        if(alllimittimesstart!=null) ew.ge("alllimittimes", alllimittimesstart);
        if(alllimittimesend!=null) ew.le("alllimittimes", alllimittimesend);
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);
        if(thumbsupnumstart!=null) ew.ge("thumbsupnum", thumbsupnumstart);
        if(thumbsupnumend!=null) ew.le("thumbsupnum", thumbsupnumend);
        if(crazilynumstart!=null) ew.ge("crazilynum", crazilynumstart);
        if(crazilynumend!=null) ew.le("crazilynum", crazilynumend);
        if(clicktimestart!=null) ew.ge("clicktime", clicktimestart);
        if(clicktimeend!=null) ew.le("clicktime", clicktimeend);
        if(discussnumstart!=null) ew.ge("discussnum", discussnumstart);
        if(discussnumend!=null) ew.le("discussnum", discussnumend);
        if(totalscorestart!=null) ew.ge("totalscore", totalscorestart);
        if(totalscoreend!=null) ew.le("totalscore", totalscoreend);
        if(onshelvesstart!=null) ew.ge("onshelves", onshelvesstart);
        if(onshelvesend!=null) ew.le("onshelves", onshelvesend);
        if(storeupnumstart!=null) ew.ge("storeupnum", storeupnumstart);
        if(storeupnumend!=null) ew.le("storeupnum", storeupnumend);

        //查询结果
		PageUtils page = bookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformation), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookinformationEntity bookinformation){
       	EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookinformation, "bookinformation"));
        return R.ok().put("data", bookinformationService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookinformationEntity bookinformation){
        EntityWrapper< BookinformationEntity> ew = new EntityWrapper< BookinformationEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookinformation, "bookinformation"));
		BookinformationView bookinformationView =  bookinformationService.selectView(ew);
		return R.ok("查询图书信息成功").put("data", bookinformationView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookinformationEntity bookinformation = bookinformationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookinformation,deSens);
        return R.ok().put("data", bookinformation);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookinformationEntity bookinformation = bookinformationService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookinformation,deSens);
        return R.ok().put("data", bookinformation);
    }



    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        BookinformationEntity bookinformation = bookinformationService.selectById(id);
        if(type.equals("1")) {
        	bookinformation.setThumbsupnum(bookinformation.getThumbsupnum()+1);
        } else {
        	bookinformation.setCrazilynum(bookinformation.getCrazilynum()+1);
        }
        bookinformationService.updateById(bookinformation);
        return R.ok("投票成功");
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增图书信息")
    public R save(@RequestBody BookinformationEntity bookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformation);
        bookinformationService.insert(bookinformation);
        return R.ok().put("data",bookinformation.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增图书信息")
    @RequestMapping("/add")
    public R add(@RequestBody BookinformationEntity bookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformation);
        bookinformationService.insert(bookinformation);
        return R.ok().put("data",bookinformation.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改图书信息")
    public R update(@RequestBody BookinformationEntity bookinformation, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformation);
        //全部更新
        bookinformationService.updateById(bookinformation);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除图书信息")
    public R delete(@RequestBody Long[] ids){
        bookinformationService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
    public R remindCount(@PathVariable("columnName") String columnName, @PathVariable("type") String type, HttpServletRequest request) {

        Wrapper<BookinformationEntity> wrapper = new EntityWrapper<BookinformationEntity>();

        Map<String, Object> params = CommonUtil.parseRequest(request);
        // 从map中获取remindStart和remindEnd，组装提醒过滤条件
        Object remindStart = params.get("remindstart") != null ? params.get("remindstart").toString() : null;
        Object remindEnd = params.get("remindend") != null ? params.get("remindend").toString() : null;
        params.remove("remindstart");
        params.remove("remindend");
        params.keySet().forEach(key -> {
            if (params.get(key) != null && params.get(key) != "") {
                wrapper.eq(key, params.get(key));
            }
        });
        switch (type) {
            case "1":
                if (remindStart != null && remindEnd != null) {
                    if (Double.parseDouble(remindStart.toString()) < Double.parseDouble(remindEnd.toString())) {
                        wrapper.ge(columnName, remindStart).le(columnName, remindEnd);
                    } else {
                        wrapper.ge(columnName, remindStart).or().le(columnName, remindEnd);
                    }
                } else if (remindStart == null && remindEnd != null) {
                    wrapper.le(columnName, remindEnd);
                } else if (remindStart != null && remindEnd == null) {
                    wrapper.ge(columnName, remindStart);
                }
                break;
            case "2":
                Date startDate = null;
                Date endDate = null;
                if (null != remindStart) {
                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date());
                    c.add(Calendar.DAY_OF_MONTH, Integer.parseInt(remindStart.toString()));
                    startDate = c.getTime();
                }
                if (null != remindEnd) {
                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date());
                    c.add(Calendar.DAY_OF_MONTH, Integer.parseInt(remindEnd.toString()));
                    endDate = c.getTime();
                }
                if (startDate != null && endDate != null) {
                    if (startDate.before(endDate)) {
                        wrapper.ge(columnName, startDate).le(columnName, endDate);
                    } else {
                        wrapper.ge(columnName, startDate).or().le(columnName, endDate);
                    }
                } else if (startDate == null && endDate != null) {
                    wrapper.le(columnName, endDate);
                } else if (startDate != null && endDate == null) {
                    wrapper.ge(columnName, startDate);
                }
                break;
            case "3":
                wrapper.in(columnName, Arrays.asList(remindStart.toString().replace("，",",").split(",")));
                break;
        }

        //根据条件，查询结果
        List<BookinformationEntity> list = bookinformationService.selectList(wrapper);
        Map<String,Object> res= new HashMap<>();
        res.put("count", list.size());
        res.put("data",list.stream().map(BookinformationEntity::getBooktitle).collect(Collectors.toList()));
        return R.ok(res);
	}
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,BookinformationEntity bookinformation, HttpServletRequest request,String pre){
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        ew.eq("onshelves","1");
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

		PageUtils page = bookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformation), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 训练推荐，模型名称(随机森林、NCF)
     *
     * @return
     */
    @RequestMapping("/trainRecommend")
    public R trainRecommend() throws Exception {
        Map<String, Map<String, Object>> features = new HashMap<>();
        // 角色特征字段
        String userFeaturesFields = "gender, age";
        List<Map<String, Object>> userDataList = (List<Map<String, Object>>) SpringContextUtils.getBeanMethod("userService", "selectMaps", new Class[]{Wrapper.class}, new Object[]{new EntityWrapper<>().setSqlSelect("id as userId,"+userFeaturesFields)});
        if (userDataList.isEmpty())  return R.ok("模型训练完成");
        // 目标特征字段
        String itemFeaturesFields = "bookclassification, price, sales";
        List<Map<String, Object>> itemDataList = bookinformationService.selectMaps(new EntityWrapper<BookinformationEntity>().setSqlSelect("id as itemId,"+itemFeaturesFields));
        if (itemDataList.isEmpty())  return R.ok("模型训练完成");

        //用户行为数据
        List<RecommendAlgorithmFactory.UserBehavior> userBehaviors = new ArrayList<>();
        // 查询订单数据
        userBehaviors.addAll(ordersService.selectList(new EntityWrapper<>()).stream().map(order -> {
            return new RecommendAlgorithmFactory.UserBehavior(order.getUserid(), order.getGoodid());
        }).collect(Collectors.toList()));
        if (userBehaviors.isEmpty())  return R.ok("模型训练完成");
        // 训练模型
        RecommendAlgorithmFactory.buildAlgorithm("随机森林", "bookinformation").train(userDataList, itemDataList, userBehaviors);
        return R.ok("模型训练完成");
    }

    /**
     * 随机森林推荐算法
     */
    @RequestMapping("/recommend")
    public R recommend(@RequestParam Map<String, Object> params,BookinformationEntity bookinformation, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        Integer limit = params.get("limit") == null ? 10 : Integer.parseInt(params.get("limit").toString());

        // 使用随机森林模型进行推荐
        List<Long> recommendations = new ArrayList<>();
        try{
            RecommendAlgorithmFactory.ModelLoader modelLoader = RecommendAlgorithmFactory.loadModel("bookinformation.model");
            // 使用随机森林模型预测
            recommendations = modelLoader.recommendItems(Long.parseLong(userId), limit, false, true);
        } catch (Exception e) {
            System.out.println("模型加载失败: " + e.getMessage());
        }
        System.out.println("Recommendations for " + userId + ":");
        recommendations.forEach(recommendation -> System.out.println(recommendation));
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();

        ew.eq("onshelves","1");
        if(recommendations!=null && recommendations.size()>0) {
            ew.in("id", recommendations);
            ew.last("order by FIELD(id, "+String.join(",", recommendations.stream().map(String::valueOf).collect(Collectors.toList()))+")");
        }
        // 根据结果查询结果并返回
        PageUtils page = bookinformationService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformation), params), params));
        List<BookinformationEntity> pageList = (List<BookinformationEntity>)page.getList();
        if(recommendations!=null && recommendations.size()>0 && pageList.size()<limit) {
            int toAddNum = limit-pageList.size();
            ew = new EntityWrapper<>();
            ew.notIn("id", recommendations);
            ew.orderBy("sales", false);
            ew.last("limit "+toAddNum);
            pageList.addAll(bookinformationService.selectList(ew));
        } else if(pageList.size()>limit) {
            pageList = pageList.subList(0, limit);
        }
        page.setList(pageList);
        return R.ok().put("data", page);
    }



    /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, @RequestParam(required = false, defaultValue = "总和") String func, HttpServletRequest request) throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformation_" + xColumnName + "_" + yColumnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        //构建查询统计条件
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        params.put("method", func);
        params.put("order", request.getParameter("order"));
        params.put("orderType", request.getParameter("orderType"));
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(StringUtils.isNotBlank(conditionColumn)&&StringUtils.isNotBlank(conditionValue))
        {
            String[] conditionColumns = conditionColumn.split(";");
            String[] conditionValues = conditionValue.split(";");

            for (int i = 0; i < conditionColumns.length; i++) {
                String column = conditionColumns[i];
                String value = conditionValues[i];

                // 处理范围查询：如果列名包含逗号，表示是范围查询
                if (column.contains(",")) {
                    String[] rangeColumns = column.split(",");
                    String[] rangeValues = value.split(",");

                    if (rangeColumns.length == 2 && rangeValues.length == 2) {
                        // 第一个列名使用 >= 条件
                        ew.ge(rangeColumns[0], rangeValues[0]);
                        // 第二个列名使用 <= 条件
                        ew.le(rangeColumns[1], rangeValues[1]);
                    }
                } else {
                    // 普通等值查询
                    ew.eq(column, value);
                }
            }
        }
        //获取结果
        List<Map<String, Object>> result = bookinformationService.selectValue(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }

    /**
     * （按值统计(多)）
     */
    @RequestMapping("/valueMul/{xColumnName}")
    public R valueMul(@PathVariable("xColumnName") String xColumnName,@RequestParam String yColumnNameMul, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, HttpServletRequest request)  throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformation_" + xColumnName + "_" + String.join("_", yColumnNameMul.split(",")) + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        String[] yColumnNames = yColumnNameMul.split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("order", request.getParameter("order"));
        params.put("orderType", request.getParameter("orderType"));
        //构建查询统计条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(StringUtils.isNotBlank(conditionColumn)&&StringUtils.isNotBlank(conditionValue))
        {
            String[] conditionColumns = conditionColumn.split(";");
            String[] conditionValues = conditionValue.split(";");

            for (int i = 0; i < conditionColumns.length; i++) {
                String column = conditionColumns[i];
                String value = conditionValues[i];

                // 处理范围查询：如果列名包含逗号，表示是范围查询
                if (column.contains(",")) {
                    String[] rangeColumns = column.split(",");
                    String[] rangeValues = value.split(",");

                    if (rangeColumns.length == 2 && rangeValues.length == 2) {
                        // 第一个列名使用 >= 条件
                        ew.ge(rangeColumns[0], rangeValues[0]);
                        // 第二个列名使用 <= 条件
                        ew.le(rangeColumns[1], rangeValues[1]);
                    }
                } else {
                    // 普通等值查询
                    ew.eq(column, value);
                }
            }
        }
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for(int i=0;i<yColumnNames.length;i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = bookinformationService.selectValue(params, ew);
            for(Map<String, Object> m : result) {
                for(String k : m.keySet()) {
                    if(m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date)m.get(k)));
                    }
                }
            }
            result2.add(result);
        }
        return R.ok().put("data", result2);
    }

    /**
     * （按值统计）时间统计类型
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}/{timeStatType}")
    public R valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, @RequestParam(required = false, defaultValue = "总和") String func, HttpServletRequest request) throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformation_" + xColumnName + "_" + yColumnName + "_"+timeStatType+".json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        params.put("timeStatType", timeStatType);
        params.put("method", func);
        params.put("order", request.getParameter("order"));
        params.put("orderType", request.getParameter("orderType"));
        //构建查询统计条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(StringUtils.isNotBlank(conditionColumn)&&StringUtils.isNotBlank(conditionValue))
        {
            String[] conditionColumns = conditionColumn.split(";");
            String[] conditionValues = conditionValue.split(";");

            for (int i = 0; i < conditionColumns.length; i++) {
                String column = conditionColumns[i];
                String value = conditionValues[i];

                // 处理范围查询：如果列名包含逗号，表示是范围查询
                if (column.contains(",")) {
                    String[] rangeColumns = column.split(",");
                    String[] rangeValues = value.split(",");

                    if (rangeColumns.length == 2 && rangeValues.length == 2) {
                        // 第一个列名使用 >= 条件
                        ew.ge(rangeColumns[0], rangeValues[0]);
                        // 第二个列名使用 <= 条件
                        ew.le(rangeColumns[1], rangeValues[1]);
                    }
                } else {
                    // 普通等值查询
                    ew.eq(column, value);
                }
            }
        }
        List<Map<String, Object>> result = bookinformationService.selectTimeStatValue(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }

    /**
     * （按值统计）时间统计类型(多)
     */
    @RequestMapping("/valueMul/{xColumnName}/{timeStatType}")
    public R valueMulDay(@PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, @RequestParam String yColumnNameMul, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, HttpServletRequest request) throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformation_" + xColumnName + "_" + String.join("_", yColumnNameMul.split(",")) + ".json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        String[] yColumnNames = yColumnNameMul.split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("timeStatType", timeStatType);
        params.put("order", request.getParameter("order"));
        params.put("orderType", request.getParameter("orderType"));
        //构建查询统计条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(StringUtils.isNotBlank(conditionColumn)&&StringUtils.isNotBlank(conditionValue))
        {
            String[] conditionColumns = conditionColumn.split(";");
            String[] conditionValues = conditionValue.split(";");

            for (int i = 0; i < conditionColumns.length; i++) {
                String column = conditionColumns[i];
                String value = conditionValues[i];

                // 处理范围查询：如果列名包含逗号，表示是范围查询
                if (column.contains(",")) {
                    String[] rangeColumns = column.split(",");
                    String[] rangeValues = value.split(",");

                    if (rangeColumns.length == 2 && rangeValues.length == 2) {
                        // 第一个列名使用 >= 条件
                        ew.ge(rangeColumns[0], rangeValues[0]);
                        // 第二个列名使用 <= 条件
                        ew.le(rangeColumns[1], rangeValues[1]);
                    }
                } else {
                    // 普通等值查询
                    ew.eq(column, value);
                }
            }
        }
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(int i=0;i<yColumnNames.length;i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = bookinformationService.selectTimeStatValue(params, ew);
            for(Map<String, Object> m : result) {
                for(String k : m.keySet()) {
                    if(m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date)m.get(k)));
                    }
                }
            }
            result2.add(result);
        }
        return R.ok().put("data", result2);
    }

    /**
     * 分组统计
     */
    @RequestMapping("/group/{columnName}")
    public R group(@PathVariable("columnName") String columnName, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, HttpServletRequest request) throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("group_bookinformation_" + columnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)){
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", columnName);
        //构建查询统计条件
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        if(StringUtils.isNotBlank(conditionColumn)&&StringUtils.isNotBlank(conditionValue))
        {
            String[] conditionColumns = conditionColumn.split(";");
            String[] conditionValues = conditionValue.split(";");

            for (int i = 0; i < conditionColumns.length; i++) {
                String column = conditionColumns[i];
                String value = conditionValues[i];

                // 处理范围查询：如果列名包含逗号，表示是范围查询
                if (column.contains(",")) {
                    String[] rangeColumns = column.split(",");
                    String[] rangeValues = value.split(",");

                    if (rangeColumns.length == 2 && rangeValues.length == 2) {
                        // 第一个列名使用 >= 条件
                        ew.ge(rangeColumns[0], rangeValues[0]);
                        // 第二个列名使用 <= 条件
                        ew.le(rangeColumns[1], rangeValues[1]);
                    }
                } else {
                    // 普通等值查询
                    ew.eq(column, value);
                }
            }
        }
        List<Map<String, Object>> result = bookinformationService.selectGroup(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }




    /**
     * 总数量
     */
    @RequestMapping("/count")
    public R count(@RequestParam Map<String, Object> params,BookinformationEntity bookinformation, HttpServletRequest request){
        EntityWrapper<BookinformationEntity> ew = new EntityWrapper<BookinformationEntity>();
        int count = bookinformationService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformation), params), params));
        return R.ok().put("data", count);
    }


}
