package com.entity.view;

import com.entity.BookmarkbookpreviewEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * bookpreview书签表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
@TableName("bookmarkbookpreview")
public class BookmarkbookpreviewView  extends BookmarkbookpreviewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public BookmarkbookpreviewView(){
	}
 
 	public BookmarkbookpreviewView(BookmarkbookpreviewEntity bookmarkbookpreviewEntity){
 	try {
			BeanUtils.copyProperties(this, bookmarkbookpreviewEntity);
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
