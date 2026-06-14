package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookmarkbookpreviewEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookmarkbookpreviewVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookmarkbookpreviewView;


/**
 * bookpreview书签表
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
public interface BookmarkbookpreviewService extends IService<BookmarkbookpreviewEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookmarkbookpreviewVO> selectListVO(Wrapper<BookmarkbookpreviewEntity> wrapper);
   	
   	BookmarkbookpreviewVO selectVO(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);
   	
   	List<BookmarkbookpreviewView> selectListView(Wrapper<BookmarkbookpreviewEntity> wrapper);
   	
   	BookmarkbookpreviewView selectView(@Param("ew") Wrapper<BookmarkbookpreviewEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookmarkbookpreviewEntity> wrapper);

   	

}

