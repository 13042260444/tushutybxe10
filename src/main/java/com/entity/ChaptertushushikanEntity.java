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
 * 图书试看章节
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
@TableName("chaptertushushikan")
@Data
public class ChaptertushushikanEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public ChaptertushushikanEntity() {
		
	}
	
	public ChaptertushushikanEntity(T t) {
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
	 * 关联表id
	 */
	private Long refid;
	
	/**
	 * 章节数
	 */
	private Integer chapternum;
	
	/**
	 * 章节标题
	 */
	private String chaptertitle;
	
	/**
	 * 章节内容
	 */
	private String content;
	

	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}
