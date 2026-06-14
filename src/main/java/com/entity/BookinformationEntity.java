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
 * 图书信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
@TableName("bookinformation")
@Data
public class BookinformationEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public BookinformationEntity() {
		
	}
	
	public BookinformationEntity(T t) {
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
	 * 书名
	 */
	private String booktitle;
	
	/**
	 * 图书封面
	 */
	private String bookcover;
	
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
	 * 销量
	 */
	private Integer sales;
	
	/**
	 * 出版日期
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	@DateTimeFormat
	private Date publicationdate;
	
	/**
	 * 图书简介
	 */
	private String bookintroduction;
	
	/**
	 * 单限
	 */
	private Integer onelimittimes;
	
	/**
	 * 库存
	 */
	private Integer alllimittimes;
	
	/**
	 * 价格
	 */
	private Double price;
	
	/**
	 * 赞
	 */
	private Integer thumbsupnum;
	
	/**
	 * 踩
	 */
	private Integer crazilynum;
	
	/**
	 * 最近点击时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date clicktime;
	
	/**
	 * 评论数
	 */
	private Integer discussnum;
	
	/**
	 * 评分
	 */
	private Double totalscore;
	
	/**
	 * 是否上架(1:上架，0:下架)
	 */
	private Integer onshelves;
	
	/**
	 * 收藏数
	 */
	private Integer storeupnum;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}
