package com.entity.model;

import com.entity.BookpreviewEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 图书试看
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public class BookpreviewModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
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
				
	
	/**
	 * 设置：booktitle
	 */
	 
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	
	/**
	 * 获取：booktitle
	 */
	public String getBooktitle() {
		return booktitle;
	}
				
	
	/**
	 * 设置：图书分类
	 */
	 
	public void setBookclassification(String bookclassification) {
		this.bookclassification = bookclassification;
	}
	
	/**
	 * 获取：图书分类
	 */
	public String getBookclassification() {
		return bookclassification;
	}
				
	
	/**
	 * 设置：作者
	 */
	 
	public void setAuthor(String author) {
		this.author = author;
	}
	
	/**
	 * 获取：作者
	 */
	public String getAuthor() {
		return author;
	}
				
	
	/**
	 * 设置：作者国籍
	 */
	 
	public void setAuthorsnationality(String authorsnationality) {
		this.authorsnationality = authorsnationality;
	}
	
	/**
	 * 获取：作者国籍
	 */
	public String getAuthorsnationality() {
		return authorsnationality;
	}
				
	
	/**
	 * 设置：语言
	 */
	 
	public void setLanguage(String language) {
		this.language = language;
	}
	
	/**
	 * 获取：语言
	 */
	public String getLanguage() {
		return language;
	}
				
	
	/**
	 * 设置：出版社
	 */
	 
	public void setPublishinghouse(String publishinghouse) {
		this.publishinghouse = publishinghouse;
	}
	
	/**
	 * 获取：出版社
	 */
	public String getPublishinghouse() {
		return publishinghouse;
	}
				
	
	/**
	 * 设置：出版日期
	 */
	 
	public void setPublicationdate(String publicationdate) {
		this.publicationdate = publicationdate;
	}
	
	/**
	 * 获取：出版日期
	 */
	public String getPublicationdate() {
		return publicationdate;
	}
				
	
	/**
	 * 设置：图书封面
	 */
	 
	public void setBookcover(String bookcover) {
		this.bookcover = bookcover;
	}
	
	/**
	 * 获取：图书封面
	 */
	public String getBookcover() {
		return bookcover;
	}
				
	
	/**
	 * 设置：图书简介
	 */
	 
	public void setBookintroduction(String bookintroduction) {
		this.bookintroduction = bookintroduction;
	}
	
	/**
	 * 获取：图书简介
	 */
	public String getBookintroduction() {
		return bookintroduction;
	}
				
	
	/**
	 * 设置：赞
	 */
	 
	public void setThumbsupnum(Integer thumbsupnum) {
		this.thumbsupnum = thumbsupnum;
	}
	
	/**
	 * 获取：赞
	 */
	public Integer getThumbsupnum() {
		return thumbsupnum;
	}
				
	
	/**
	 * 设置：踩
	 */
	 
	public void setCrazilynum(Integer crazilynum) {
		this.crazilynum = crazilynum;
	}
	
	/**
	 * 获取：踩
	 */
	public Integer getCrazilynum() {
		return crazilynum;
	}
				
	
	/**
	 * 设置：收藏数
	 */
	 
	public void setStoreupnum(Integer storeupnum) {
		this.storeupnum = storeupnum;
	}
	
	/**
	 * 获取：收藏数
	 */
	public Integer getStoreupnum() {
		return storeupnum;
	}
			
}
