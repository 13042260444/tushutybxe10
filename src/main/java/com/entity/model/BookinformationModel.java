package com.entity.model;

import com.entity.BookinformationEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 图书信息
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public class BookinformationModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
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
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
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
				
	
	/**
	 * 设置：书名
	 */
	 
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	
	/**
	 * 获取：书名
	 */
	public String getBooktitle() {
		return booktitle;
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
	 * 设置：销量
	 */
	 
	public void setSales(Integer sales) {
		this.sales = sales;
	}
	
	/**
	 * 获取：销量
	 */
	public Integer getSales() {
		return sales;
	}
				
	
	/**
	 * 设置：出版日期
	 */
	 
	public void setPublicationdate(Date publicationdate) {
		this.publicationdate = publicationdate;
	}
	
	/**
	 * 获取：出版日期
	 */
	public Date getPublicationdate() {
		return publicationdate;
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
	 * 设置：单限
	 */
	 
	public void setOnelimittimes(Integer onelimittimes) {
		this.onelimittimes = onelimittimes;
	}
	
	/**
	 * 获取：单限
	 */
	public Integer getOnelimittimes() {
		return onelimittimes;
	}
				
	
	/**
	 * 设置：库存
	 */
	 
	public void setAlllimittimes(Integer alllimittimes) {
		this.alllimittimes = alllimittimes;
	}
	
	/**
	 * 获取：库存
	 */
	public Integer getAlllimittimes() {
		return alllimittimes;
	}
				
	
	/**
	 * 设置：价格
	 */
	 
	public void setPrice(Double price) {
		this.price = price;
	}
	
	/**
	 * 获取：价格
	 */
	public Double getPrice() {
		return price;
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
	 * 设置：最近点击时间
	 */
	 
	public void setClicktime(Date clicktime) {
		this.clicktime = clicktime;
	}
	
	/**
	 * 获取：最近点击时间
	 */
	public Date getClicktime() {
		return clicktime;
	}
				
	
	/**
	 * 设置：评论数
	 */
	 
	public void setDiscussnum(Integer discussnum) {
		this.discussnum = discussnum;
	}
	
	/**
	 * 获取：评论数
	 */
	public Integer getDiscussnum() {
		return discussnum;
	}
				
	
	/**
	 * 设置：评分
	 */
	 
	public void setTotalscore(Double totalscore) {
		this.totalscore = totalscore;
	}
	
	/**
	 * 获取：评分
	 */
	public Double getTotalscore() {
		return totalscore;
	}
				
	
	/**
	 * 设置：是否上架(1:上架，0:下架)
	 */
	 
	public void setOnshelves(Integer onshelves) {
		this.onshelves = onshelves;
	}
	
	/**
	 * 获取：是否上架(1:上架，0:下架)
	 */
	public Integer getOnshelves() {
		return onshelves;
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
