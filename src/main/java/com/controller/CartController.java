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

import com.entity.CartEntity;
import com.entity.view.CartView;

import com.service.CartService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 购物车表
 * 后端接口
 * @author 
 * @email 
 * @date 2026-05-13 17:46:35
 */
@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,CartEntity cart,
		HttpServletRequest request){
        if(!request.getSession().getAttribute("role").toString().equals("管理员")) {
            cart.setUserid((Long)request.getSession().getAttribute("userId"));
        }
        //设置查询条件
        EntityWrapper<CartEntity> ew = new EntityWrapper<CartEntity>();


        //查询结果
		PageUtils page = cartService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cart), params), params));
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
    public R list(@RequestParam Map<String, Object> params,CartEntity cart,
                @RequestParam(required = false) Double buynumberstart,
                @RequestParam(required = false) Double buynumberend,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<CartEntity> ew = new EntityWrapper<CartEntity>();
        if(buynumberstart!=null) ew.ge("buynumber", buynumberstart);
        if(buynumberend!=null) ew.le("buynumber", buynumberend);
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);

        //查询结果
		PageUtils page = cartService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cart), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( CartEntity cart){
       	EntityWrapper<CartEntity> ew = new EntityWrapper<CartEntity>();
      	ew.allEq(MPUtil.allEQMapPre( cart, "cart"));
        return R.ok().put("data", cartService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(CartEntity cart){
        EntityWrapper< CartEntity> ew = new EntityWrapper< CartEntity>();
 		ew.allEq(MPUtil.allEQMapPre( cart, "cart"));
		CartView cartView =  cartService.selectView(ew);
		return R.ok("查询购物车表成功").put("data", cartView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        CartEntity cart = cartService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(cart,deSens);
        return R.ok().put("data", cart);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        CartEntity cart = cartService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(cart,deSens);
        return R.ok().put("data", cart);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增购物车表")
    public R save(@RequestBody CartEntity cart, HttpServletRequest request){
        //ValidatorUtils.validateEntity(cart);
        if(cart.getUserid()==null){
            cart.setUserid((Long) request.getSession().getAttribute("userId"));
        }
        cartService.insert(cart);
        return R.ok().put("data",cart.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增购物车表")
    @RequestMapping("/add")
    public R add(@RequestBody CartEntity cart, HttpServletRequest request){
        //ValidatorUtils.validateEntity(cart);
        cartService.insert(cart);
        return R.ok().put("data",cart.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        CartEntity cart = cartService.selectOne(new EntityWrapper<CartEntity>().eq("", username));
        return R.ok().put("data", cart);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody CartEntity cart, HttpServletRequest request){
        //ValidatorUtils.validateEntity(cart);
        //全部更新
        cartService.updateById(cart);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除购物车表")
    public R delete(@RequestBody Long[] ids){
        cartService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,CartEntity cart, HttpServletRequest request,String pre){
        EntityWrapper<CartEntity> ew = new EntityWrapper<CartEntity>();
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

		PageUtils page = cartService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cart), params), params));
        return R.ok().put("data", page);
    }









}
