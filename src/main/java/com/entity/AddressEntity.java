package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.*;
import org.springframework.beans.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 地址
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:35
 */
@TableName("address")
@Data
public class AddressEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public AddressEntity() {
		
	}
	
	public AddressEntity(T t) {
		try {
			BeanUtils.copyProperties(t, this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 主键id
	 */
    @TableId(type = IdType.AUTO)
	private Long id;
	/**
	 * 用户id
	 */
	private Long userid;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 收货人
	 */
	private String name;
	
	/**
	 * 电话
	 */
	private String phone;
	
	/**
	 * 是否默认地址[是/否]
	 */
	private String isdefault;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}
