package com.dao;

import com.entity.BookinformationforecastEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookinformationforecastVO;
import com.entity.view.BookinformationforecastView;


/**
 * 销量预测
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface BookinformationforecastDao extends BaseMapper<BookinformationforecastEntity> {
	
	List<BookinformationforecastVO> selectListVO(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);
	
	BookinformationforecastVO selectVO(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);
	
	List<BookinformationforecastView> selectListView(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);

	List<BookinformationforecastView> selectListView(Pagination page,@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);

	
	BookinformationforecastView selectView(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);



}
