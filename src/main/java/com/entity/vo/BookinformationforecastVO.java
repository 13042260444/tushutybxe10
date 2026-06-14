package com.entity.vo;

import com.entity.BookinformationforecastEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 销量预测
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public class BookinformationforecastVO  implements Serializable {
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
