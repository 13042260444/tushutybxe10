package com.dao;

import com.entity.ChaptertushushikanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ChaptertushushikanVO;
import com.entity.view.ChaptertushushikanView;


/**
 * 图书试看章节
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface ChaptertushushikanDao extends BaseMapper<ChaptertushushikanEntity> {
	
	List<ChaptertushushikanVO> selectListVO(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);
	
	ChaptertushushikanVO selectVO(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);
	
	List<ChaptertushushikanView> selectListView(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);

	List<ChaptertushushikanView> selectListView(Pagination page,@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);

	
	ChaptertushushikanView selectView(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);
	

}
