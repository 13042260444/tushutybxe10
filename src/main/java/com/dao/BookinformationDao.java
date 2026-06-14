package com.dao;

import com.entity.BookinformationEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookinformationVO;
import com.entity.view.BookinformationView;


/**
 * 图书信息
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookinformationDao extends BaseMapper<BookinformationEntity> {
	
	List<BookinformationVO> selectListVO(@Param("ew") Wrapper<BookinformationEntity> wrapper);
	
	BookinformationVO selectVO(@Param("ew") Wrapper<BookinformationEntity> wrapper);
	
	List<BookinformationView> selectListView(@Param("ew") Wrapper<BookinformationEntity> wrapper);

	List<BookinformationView> selectListView(Pagination page,@Param("ew") Wrapper<BookinformationEntity> wrapper);

	
	BookinformationView selectView(@Param("ew") Wrapper<BookinformationEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<BookinformationEntity> wrapper);



}
