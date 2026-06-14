package com.dao;

import com.entity.BookpreviewEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookpreviewVO;
import com.entity.view.BookpreviewView;


/**
 * 图书试看
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookpreviewDao extends BaseMapper<BookpreviewEntity> {
	
	List<BookpreviewVO> selectListVO(@Param("ew") Wrapper<BookpreviewEntity> wrapper);
	
	BookpreviewVO selectVO(@Param("ew") Wrapper<BookpreviewEntity> wrapper);
	
	List<BookpreviewView> selectListView(@Param("ew") Wrapper<BookpreviewEntity> wrapper);

	List<BookpreviewView> selectListView(Pagination page,@Param("ew") Wrapper<BookpreviewEntity> wrapper);

	
	BookpreviewView selectView(@Param("ew") Wrapper<BookpreviewEntity> wrapper);
	

}
