package com.entity.model;

import com.entity.BookinformationforecastEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 销量预测
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public class BookinformationforecastModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 价格
	 */
	
	private Double price;
		
	/**
	 * 销量
	 */
	
	private Integer sales;
				
	
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
			
}
