package com.dao;

import com.entity.BookannouncementEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BookannouncementVO;
import com.entity.view.BookannouncementView;


/**
 * 图书公告
 * 
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface BookannouncementDao extends BaseMapper<BookannouncementEntity> {
	
	List<BookannouncementVO> selectListVO(@Param("ew") Wrapper<BookannouncementEntity> wrapper);
	
	BookannouncementVO selectVO(@Param("ew") Wrapper<BookannouncementEntity> wrapper);
	
	List<BookannouncementView> selectListView(@Param("ew") Wrapper<BookannouncementEntity> wrapper);

	List<BookannouncementView> selectListView(Pagination page,@Param("ew") Wrapper<BookannouncementEntity> wrapper);

	
	BookannouncementView selectView(@Param("ew") Wrapper<BookannouncementEntity> wrapper);
	

}
