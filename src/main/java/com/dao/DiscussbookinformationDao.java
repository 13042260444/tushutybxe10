package com.dao;

import com.entity.DiscussbookinformationEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussbookinformationVO;
import com.entity.view.DiscussbookinformationView;


/**
 * 图书信息
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
public interface DiscussbookinformationDao extends BaseMapper<DiscussbookinformationEntity> {
	
	List<DiscussbookinformationVO> selectListVO(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);
	
	DiscussbookinformationVO selectVO(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);
	
	List<DiscussbookinformationView> selectListView(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);

	List<DiscussbookinformationView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);

	
	DiscussbookinformationView selectView(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);
	

}
