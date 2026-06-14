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
 * 图书试看
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
@TableName("bookpreview")
@Data
public class BookpreviewEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public BookpreviewEntity() {
		
	}
	
	public BookpreviewEntity(T t) {
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
	 * ISBN
	 */
	private String isbn;
	
	/**
	 * booktitle
	 */
	private String booktitle;
	
	/**
	 * 图书分类
	 */
	private String bookclassification;
	
	/**
	 * 作者
	 */
	private String author;
	
	/**
	 * 作者国籍
	 */
	private String authorsnationality;
	
	/**
	 * 语言
	 */
	private String language;
	
	/**
	 * 出版社
	 */
	private String publishinghouse;
	
	/**
	 * 出版日期
	 */
	private String publicationdate;
	
	/**
	 * 图书封面
	 */
	private String bookcover;
	
	/**
	 * 图书简介
	 */
	private String bookintroduction;
	
	/**
	 * 赞
	 */
	private Integer thumbsupnum;
	
	/**
	 * 踩
	 */
	private Integer crazilynum;
	
	/**
	 * 收藏数
	 */
	private Integer storeupnum;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}
