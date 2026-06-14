package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookannouncementEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookannouncementVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookannouncementView;


/**
 * 图书公告
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface BookannouncementService extends IService<BookannouncementEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookannouncementVO> selectListVO(Wrapper<BookannouncementEntity> wrapper);
   	
   	BookannouncementVO selectVO(@Param("ew") Wrapper<BookannouncementEntity> wrapper);
   	
   	List<BookannouncementView> selectListView(Wrapper<BookannouncementEntity> wrapper);
   	
   	BookannouncementView selectView(@Param("ew") Wrapper<BookannouncementEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookannouncementEntity> wrapper);

   	

}

