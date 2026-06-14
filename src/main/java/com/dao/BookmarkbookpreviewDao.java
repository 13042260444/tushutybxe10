package com.dao;

import com.entity.BookmarkbookpreviewEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookmarkbookpreviewVO;
import com.entity.view.BookmarkbookpreviewView;


/**
 * bookpreview书签表
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
public interface BookmarkbookpreviewDao extends BaseMapper<BookmarkbookpreviewEntity> {
	
	List<BookmarkbookpreviewVO> selectListVO(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);
	
	BookmarkbookpreviewVO selectVO(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);
	
	List<BookmarkbookpreviewView> selectListView(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);

	List<BookmarkbookpreviewView> selectListView(Pagination page,@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);

	
	BookmarkbookpreviewView selectView(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);
	

}
