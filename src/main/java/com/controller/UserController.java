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
import com.service.TokenService;
import com.entity.TokenEntity;
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

import com.entity.UserEntity;
import com.entity.view.UserView;

import com.service.UserService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
//    /**
//     * 修改密码
//     */
//    @RequestMapping("/updatePassword")
//    @IgnoreAuth
//    public R updatePassword(String oldPassword, String newPassword, HttpServletRequest request){
//        Long id = (Long)request.getSession().getAttribute("userId");
//        UserEntity u = userService.selectById(id);
//        if(u==null) {
//            return R.error("用户不存在");
//        }
//        if(!u.getPassword().equals(EncryptUtil.md5(oldPassword))) {
//            return R.error("原密码错误");
//        }
//        u.setPassword(EncryptUtil.md5(newPassword));
//        userService.updateById(u);
//        return R.ok("密码修改成功,下次登录生效");
//    }



/**
 * 用户
 * 后端接口
 * @author
 * @email
 * @date 2026-05-13 17:46:33
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;







	@Autowired
	private TokenService tokenService;

	/**
	 * 登录
	 */
	@IgnoreAuth
	@RequestMapping(value = "/login")
	public R login(String username, String password, String captcha, HttpServletRequest request) {
		// 根据登录查询用户信息
        UserEntity u = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", username));
        // 判断用户锁定状态
        if(u!=null && u.getStatus().intValue()==1) {
            //返回已锁定提示
            return R.error("账号已锁定，请联系管理员。");
        }
        if(u==null) {
            //账号或密码不正确提示
			return R.error("账号或密码不正确");
		}
        // 兼容MD5和AES两种加密方式
        String inputPassword = password;
        boolean passwordMatch = false;
        // 先尝试AES加密比对
        try {
            String aesEncrypted = EncryptUtil.aesEncrypt(inputPassword);
            if(u.getPassword().equals(aesEncrypted)) {
                passwordMatch = true;
            }
        } catch (Exception e) {
            // AES加密失败，继续尝试MD5
        }
        // 如果AES不匹配，尝试MD5比对（兼容旧数据）
        if(!passwordMatch && u.getPassword().equals(EncryptUtil.md5(inputPassword))) {
            passwordMatch = true;
        }
        if(!passwordMatch) {
			return R.error("账号或密码不正确");
		}
        // 获取登录token
        String token = tokenService.generateToken(u.getId(), username,"user",  "user" );
        //返回token
		return R.ok().put("token", token);
	}



	/**
     * 注册
     */
	@IgnoreAuth
    @RequestMapping("/register")
    public R register(@RequestBody UserEntity user){
    	//ValidatorUtils.validateEntity(user);
        System.out.println("[DEBUG 注册] 收到注册请求, account=" + user.getAccount() + ", 原文密码=" + user.getPassword());
        //根据登录账号获取用户信息判断是否存在该用户，否则返回错误信息
    	UserEntity u = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", user.getAccount()));
		if(u!=null) {
			return R.error("注册用户已存在");
		}
        //判断是否存在相同账号，否则返回错误信息
        if(userService.selectCount(new EntityWrapper<UserEntity>().eq("account", user.getAccount()))>0) {
            return R.error("账号已存在");
        }
		Long uId = new Date().getTime();
		user.setId(uId);
		String encryptedPwd = EncryptUtil.aesEncrypt(user.getPassword());
		System.out.println("[DEBUG 注册] AES加密后密码=" + encryptedPwd);
        user.setPassword(encryptedPwd);
        System.out.println("[DEBUG 注册] 最终存入的密码=" + user.getPassword());
        //保存用户
        userService.insert(user);
        System.out.println("[DEBUG 注册] 插入数据库完成");
        return R.ok();
    }



	/**
	 * 退出
	 */
	@RequestMapping("/logout")
	public R logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return R.ok("退出成功");
	}

	/**
     * 获取用户的session用户信息
     */
    @RequestMapping("/session")
    public R getCurrUser(HttpServletRequest request){
    	Long id = (Long)request.getSession().getAttribute("userId");
        UserEntity u = userService.selectById(id);
        if(u != null && u.getPassword() != null) {
            try {
                u.setPassword(EncryptUtil.aesDecrypt(u.getPassword()));
            } catch (Exception e) {
                // 如果是旧的MD5密码无法解密，保持原样
            }
        }
        return R.ok().put("data", u);
    }

    /**
     * 密码重置
     */
    @IgnoreAuth
	@RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request){
    	//根据登录账号判断是否存在用户信息，否则返回错误信息
        UserEntity u = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", username));
    	if(u==null) {
    		return R.error("账号不存在");
    	}
        //重置密码为123456
        u.setPassword(EncryptUtil.aesEncrypt("123456"));
        userService.updateById(u);
        return R.ok("密码已重置为：123456");
    }

    /**
     * 获取账号列表
     */
    @RequestMapping("/accountList")
    public R getAccountList(@RequestParam Map<String, Object> params,UserEntity user){
        EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
        Wrapper<UserEntity> wrapper =MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, user), params), params);
        List<Map> list = userService.selectList(wrapper).stream().map(v -> {
            Map<String, Object> map = new HashMap<>();
            map.put("id", v.getId());
            map.put("account", v.getAccount());
            return map;
        }).collect(Collectors.toList());
        return R.ok().put("data", list);
    }






    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,UserEntity user,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();


        //查询结果
		PageUtils page = userService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, user), params), params));
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
    public R list(@RequestParam Map<String, Object> params,UserEntity user,
                @RequestParam(required = false) Double agestart,
                @RequestParam(required = false) Double ageend,
                @RequestParam(required = false) Double moneystart,
                @RequestParam(required = false) Double moneyend,
                @RequestParam(required = false) Double statusstart,
                @RequestParam(required = false) Double statusend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
        if(agestart!=null) ew.ge("age", agestart);
        if(ageend!=null) ew.le("age", ageend);
        if(moneystart!=null) ew.ge("money", moneystart);
        if(moneyend!=null) ew.le("money", moneyend);
        if(statusstart!=null) ew.ge("status", statusstart);
        if(statusend!=null) ew.le("status", statusend);

        //查询结果
		PageUtils page = userService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, user), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( UserEntity user){
       	EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
      	ew.allEq(MPUtil.allEQMapPre( user, "user"));
        return R.ok().put("data", userService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(UserEntity user){
        EntityWrapper< UserEntity> ew = new EntityWrapper< UserEntity>();
 		ew.allEq(MPUtil.allEQMapPre( user, "user"));
		UserView userView =  userService.selectView(ew);
		return R.ok("查询用户成功").put("data", userView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        UserEntity user = userService.selectById(id);
        if(user != null && user.getPassword() != null) {
            try {
                user.setPassword(EncryptUtil.aesDecrypt(user.getPassword()));
            } catch (Exception e) {
                // 如果是旧的MD5密码无法解密，保持原样
            }
        }
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(user,deSens);
        return R.ok().put("data", user);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        UserEntity user = userService.selectById(id);
        if(user != null && user.getPassword() != null) {
            try {
                user.setPassword(EncryptUtil.aesDecrypt(user.getPassword()));
            } catch (Exception e) {
                // 如果是旧的MD5密码无法解密，保持原样
            }
        }
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(user,deSens);
        return R.ok().put("data", user);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    @SysLog("新增用户")
    public R save(@RequestBody UserEntity user, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(userService.selectCount(new EntityWrapper<UserEntity>().eq("account", user.getAccount()))>0) {
            return R.error("账号已存在");
        }
        //ValidatorUtils.validateEntity(user);
        //验证账号唯一性，否则返回错误信息
        UserEntity u = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", user.getAccount()));
        if(u!=null) {
            return R.error("用户已存在");
        }
    	user.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		user.setId(new Date().getTime());
    	user.setPassword(EncryptUtil.aesEncrypt(user.getPassword()));
        userService.insert(user);
        return R.ok().put("data",user.getId());
    }

    /**
     * 前台保存
     */
    @SysLog("新增用户")
    @RequestMapping("/add")
    public R add(@RequestBody UserEntity user, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(userService.selectCount(new EntityWrapper<UserEntity>().eq("account", user.getAccount()))>0) {
            return R.error("账号已存在");
        }
        //ValidatorUtils.validateEntity(user);
        //验证账号唯一性，否则返回错误信息
        UserEntity u = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", user.getAccount()));
        if(u!=null) {
            return R.error("用户已存在");
        }
    	user.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		user.setId(new Date().getTime());
    	user.setPassword(EncryptUtil.aesEncrypt(user.getPassword()));
        userService.insert(user);
        return R.ok().put("data",user.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        UserEntity user = userService.selectOne(new EntityWrapper<UserEntity>().eq("account", username));
        if(user != null && user.getPassword() != null) {
            try {
                user.setPassword(EncryptUtil.aesDecrypt(user.getPassword()));
            } catch (Exception e) {
                // 如果是旧的MD5密码无法解密，保持原样
            }
        }
        return R.ok().put("data", user);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody UserEntity user, HttpServletRequest request){
        //ValidatorUtils.validateEntity(user);
        //验证字段唯一性，否则返回错误信息
        if(userService.selectCount(new EntityWrapper<UserEntity>().ne("id", user.getId()).eq("account", user.getAccount()))>0) {
            return R.error("账号已存在");
        }
        //全部更新
        if(user.getPassword() != null && user.getPassword().length() != 24) {
            user.setPassword(EncryptUtil.aesEncrypt(user.getPassword()));
        }
        userService.updateById(user);
        if(null!=user.getAccount())
        {
            // 修改token
            TokenEntity tokenEntity = new TokenEntity();
            tokenEntity.setUsername(user.getAccount());
            tokenService.update(tokenEntity, new EntityWrapper<TokenEntity>().eq("userid", user.getId()));
        }
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    @SysLog("删除用户")
    public R delete(@RequestBody Long[] ids){
        userService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }










}
