package com.dao;

import com.entity.BookclassificationEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookclassificationVO;
import com.entity.view.BookclassificationView;


/**
 * 图书分类
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookclassificationDao extends BaseMapper<BookclassificationEntity> {
	
	List<BookclassificationVO> selectListVO(@Param("ew") Wrapper<BookclassificationEntity> wrapper);
	
	BookclassificationVO selectVO(@Param("ew") Wrapper<BookclassificationEntity> wrapper);
	
	List<BookclassificationView> selectListView(@Param("ew") Wrapper<BookclassificationEntity> wrapper);

	List<BookclassificationView> selectListView(Pagination page,@Param("ew") Wrapper<BookclassificationEntity> wrapper);

	
	BookclassificationView selectView(@Param("ew") Wrapper<BookclassificationEntity> wrapper);
	

}
