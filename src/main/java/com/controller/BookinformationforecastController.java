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

import com.entity.BookinformationforecastEntity;
import com.entity.view.BookinformationforecastView;

import com.service.BookinformationforecastService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.BookinformationService;
import com.entity.BookinformationEntity;
import com.algorithm.AlgorithmFactory;
import java.util.stream.Stream;
import org.springframework.util.ResourceUtils;
import java.io.File;

/**
 * 销量预测
 * 后端接口
 * @author
 * @email
 * @date 2026-05-13 17:46:34
 */
@RestController
@RequestMapping("/bookinformationforecast")
public class BookinformationforecastController {
    @Autowired
    private BookinformationforecastService bookinformationforecastService;
    @Autowired
    private BookinformationService bookinformationService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BookinformationforecastEntity bookinformationforecast,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();


        //查询结果
		PageUtils page = bookinformationforecastService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformationforecast), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BookinformationforecastEntity bookinformationforecast,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
                @RequestParam(required = false) Double salesstart,
                @RequestParam(required = false) Double salesend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);
        if(salesstart!=null) ew.ge("sales", salesstart);
        if(salesend!=null) ew.le("sales", salesend);

        //查询结果
		PageUtils page = bookinformationforecastService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformationforecast), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BookinformationforecastEntity bookinformationforecast){
       	EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bookinformationforecast, "bookinformationforecast"));
        return R.ok().put("data", bookinformationforecastService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BookinformationforecastEntity bookinformationforecast){
        EntityWrapper< BookinformationforecastEntity> ew = new EntityWrapper< BookinformationforecastEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bookinformationforecast, "bookinformationforecast"));
		BookinformationforecastView bookinformationforecastView =  bookinformationforecastService.selectView(ew);
		return R.ok("查询销量预测成功").put("data", bookinformationforecastView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BookinformationforecastEntity bookinformationforecast = bookinformationforecastService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookinformationforecast,deSens);
        return R.ok().put("data", bookinformationforecast);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BookinformationforecastEntity bookinformationforecast = bookinformationforecastService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bookinformationforecast,deSens);
        return R.ok().put("data", bookinformationforecast);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增销量预测")
    public R save(@RequestBody BookinformationforecastEntity bookinformationforecast, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformationforecast);
        bookinformationforecastService.insert(bookinformationforecast);
        return R.ok().put("data",bookinformationforecast.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增销量预测")
    @RequestMapping("/add")
    public R add(@RequestBody BookinformationforecastEntity bookinformationforecast, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformationforecast);
        bookinformationforecastService.insert(bookinformationforecast);
        return R.ok().put("data",bookinformationforecast.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @SysLog("修改销量预测")
    public R update(@RequestBody BookinformationforecastEntity bookinformationforecast, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bookinformationforecast);
        //全部更新
        bookinformationforecastService.updateById(bookinformationforecast);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除销量预测")
    public R delete(@RequestBody Long[] ids){
        bookinformationforecastService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }







    /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @RequestParam(required = false) String conditionColumn, @RequestParam(required = false) String conditionValue, @RequestParam(required = false, defaultValue = "总和") String func, HttpServletRequest request) throws IOException {
        //读取文件，如果文件存在，则优先返回文件内容
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformationforecast_" + xColumnName + "_" + yColumnName + "_timeType.json");
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
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
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
        List<Map<String, Object>> result = bookinformationforecastService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformationforecast_" + xColumnName + "_" + String.join("_", yColumnNameMul.split(",")) + "_timeType.json");
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
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
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
            List<Map<String, Object>> result = bookinformationforecastService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformationforecast_" + xColumnName + "_" + yColumnName + "_"+timeStatType+".json");
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
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
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
        List<Map<String, Object>> result = bookinformationforecastService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_bookinformationforecast_" + xColumnName + "_" + String.join("_", yColumnNameMul.split(",")) + ".json");
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
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
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
            List<Map<String, Object>> result = bookinformationforecastService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("group_bookinformationforecast_" + columnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)){
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", columnName);
        //构建查询统计条件
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
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
        List<Map<String, Object>> result = bookinformationforecastService.selectGroup(params, ew);
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
    public R count(@RequestParam Map<String, Object> params,BookinformationforecastEntity bookinformationforecast, HttpServletRequest request){
        EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<BookinformationforecastEntity>();
        int count = bookinformationforecastService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bookinformationforecast), params), params));
        return R.ok().put("data", count);
    }


    /**
     * 获取预测图片
     *
     * @return
     */
    @RequestMapping("/forecastimgs")
    public R forecastimgs() {
        try {
            File uploadDir = new File(ResourceUtils.getURL("classpath:static").getPath(), "upload");

            if (!uploadDir.exists() || !uploadDir.isDirectory()) {
                return R.error("指定的目录不存在或不是一个有效文件夹");
            }
            Set<String> modelNames = new HashSet<>();
            modelNames.add("Bookinformationforecast_随机森林回归".replace("回归","").replace("分类",""));
            // 使用 Files.list 遍历目录，筛选符合条件的 .png 文件
            List<String> list = java.nio.file.Files.list(uploadDir.toPath())
                    .filter(path -> path.toString().endsWith(".png") &&
                            modelNames.stream().anyMatch(name -> path.getFileName().toString().contains(name)))
                    .map(path -> "upload/" + path.getFileName().toString()) // 构建相对路径
                    .collect(Collectors.toList());
            if (list.isEmpty()) {
                return R.error("请先完成预测");
            }
            return R.ok().put("data", list);
        } catch (IOException e) {
            e.printStackTrace();
            return R.error("服务器内部错误，请稍后再试");
        }
    }

    /**
      * 随机森林回归 预测算法
      */
    @RequestMapping("/forecast")
    public R forecast(HttpServletRequest request) throws Exception {
        // 创建查询包装器，设置SQL查询字段，并确保字段不为空
        Wrapper<BookinformationEntity> wrapper = new EntityWrapper<>();
        // 预测特征值字段
        String[] featureNames = "booktitle,price".split(",");
        // 预测目标字段
        String[] targetNames = "sales".split(",");
        // 分类特征字段
        String[] categoricalFeaturesNames = new String[0];
        // 合并特征值和目标值数组，用于SQL查询
        String[] allFields = Stream.of(featureNames, targetNames, categoricalFeaturesNames).flatMap(Arrays::stream).toArray(String[]::new);
        wrapper.setSqlSelect(allFields);
        for (String arr : allFields) {
            wrapper.isNotNull(arr).ne(arr, "");
        }
        // 1. 获取请求数据列表
        Map<String, Object> params = CommonUtil.parseRequest(request);
        // 2. 获取数据列表
        List<Map<String, Object>> dataList =bookinformationService.selectMaps(wrapper);
        // 3. 使用指定模型进行预测，并返回预测结果
        List<Map<String, Object>> result = AlgorithmFactory.getAlgorithm("随机森林回归").train("Bookinformationforecast", dataList,
                Arrays.asList(featureNames), Arrays.asList(targetNames),
                Arrays.asList(categoricalFeaturesNames)).predict(params).
                generateVisualization().getPredictResult();
        // 4. 更新数据库
        for (Map<String, Object> forecastRes : result) {
            EntityWrapper<BookinformationforecastEntity> ew = new EntityWrapper<>();
            ew.eq("id", params.get("id"));
            for (Map.Entry<String, Object> entry : forecastRes.entrySet()) {
                String updateSet = entry.getKey() + "='" + entry.getValue().toString() + "'";
                bookinformationforecastService.updateForSet(updateSet, ew);
            }
        }
        return R.ok();
    }
}
