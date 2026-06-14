package com.entity.model;

import com.entity.ChaptertushushikanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 图书试看章节
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public class ChaptertushushikanModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
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
		

		
	
	/**
	 * 设置：章节数
	 */
	 
	public void setChapternum(Integer chapternum) {
		this.chapternum = chapternum;
	}
	
	/**
	 * 获取：章节数
	 */
	public Integer getChapternum() {
		return chapternum;
	}
				
	
	/**
	 * 设置：章节标题
	 */
	 
	public void setChaptertitle(String chaptertitle) {
		this.chaptertitle = chaptertitle;
	}
	
	/**
	 * 获取：章节标题
	 */
	public String getChaptertitle() {
		return chaptertitle;
	}
				
	
	/**
	 * 设置：章节内容
	 */
	 
	public void setContent(String content) {
		this.content = content;
	}
	
	/**
	 * 获取：章节内容
	 */
	public String getContent() {
		return content;
	}
			
}
