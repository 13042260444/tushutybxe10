package com.entity.view;

import com.entity.UsersEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 管理员
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-05-13 17:46:35
 */
@TableName("users")
public class UsersView  extends UsersEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public UsersView(){
	}
 
 	public UsersView(UsersEntity usersEntity){
 	try {
			BeanUtils.copyProperties(this, usersEntity);
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
