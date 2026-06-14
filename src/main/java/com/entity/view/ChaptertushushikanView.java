package com.entity.view;

import com.entity.ChaptertushushikanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 图书试看章节
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
@TableName("chaptertushushikan")
public class ChaptertushushikanView  extends ChaptertushushikanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ChaptertushushikanView(){
	}
 
 	public ChaptertushushikanView(ChaptertushushikanEntity chaptertushushikanEntity){
 	try {
			BeanUtils.copyProperties(this, chaptertushushikanEntity);
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
