package com.entity.vo;

import com.entity.UserEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 用户
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public class UserVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 密码
	 */
	
	private String password;
		
	/**
	 * 姓名
	 */
	
	private String name;
		
	/**
	 * 性别
	 */
	
	private String gender;
		
	/**
	 * 年龄
	 */
	
	private Integer age;
		
	/**
	 * 手机
	 */
	
	private String mobilephone;
		
	/**
	 * 头像
	 */
	
	private String avatar;
		
	/**
	 * 余额
	 */
	
	private Double money;
		
	/**
	 * 密保问题
	 */
	
	private String pquestion;
		
	/**
	 * 密保答案
	 */
	
	private String panswer;
		
	/**
	 * 状态
	 */
	
	private Integer status;
				
	
	/**
	 * 设置：密码
	 */
	 
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 获取：密码
	 */
	public String getPassword() {
		return password;
	}
				
	
	/**
	 * 设置：姓名
	 */
	 
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 获取：姓名
	 */
	public String getName() {
		return name;
	}
				
	
	/**
	 * 设置：性别
	 */
	 
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	/**
	 * 获取：性别
	 */
	public String getGender() {
		return gender;
	}
				
	
	/**
	 * 设置：年龄
	 */
	 
	public void setAge(Integer age) {
		this.age = age;
	}
	
	/**
	 * 获取：年龄
	 */
	public Integer getAge() {
		return age;
	}
				
	
	/**
	 * 设置：手机
	 */
	 
	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}
	
	/**
	 * 获取：手机
	 */
	public String getMobilephone() {
		return mobilephone;
	}
				
	
	/**
	 * 设置：头像
	 */
	 
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	/**
	 * 获取：头像
	 */
	public String getAvatar() {
		return avatar;
	}
				
	
	/**
	 * 设置：余额
	 */
	 
	public void setMoney(Double money) {
		this.money = money;
	}
	
	/**
	 * 获取：余额
	 */
	public Double getMoney() {
		return money;
	}
				
	
	/**
	 * 设置：密保问题
	 */
	 
	public void setPquestion(String pquestion) {
		this.pquestion = pquestion;
	}
	
	/**
	 * 获取：密保问题
	 */
	public String getPquestion() {
		return pquestion;
	}
				
	
	/**
	 * 设置：密保答案
	 */
	 
	public void setPanswer(String panswer) {
		this.panswer = panswer;
	}
	
	/**
	 * 获取：密保答案
	 */
	public String getPanswer() {
		return panswer;
	}
				
	
	/**
	 * 设置：状态
	 */
	 
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	/**
	 * 获取：状态
	 */
	public Integer getStatus() {
		return status;
	}
			
}
