package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookpreviewEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookpreviewVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookpreviewView;


/**
 * 图书试看
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookpreviewService extends IService<BookpreviewEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookpreviewVO> selectListVO(Wrapper<BookpreviewEntity> wrapper);
   	
   	BookpreviewVO selectVO(@Param("ew") Wrapper<BookpreviewEntity> wrapper);
   	
   	List<BookpreviewView> selectListView(Wrapper<BookpreviewEntity> wrapper);
   	
   	BookpreviewView selectView(@Param("ew") Wrapper<BookpreviewEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookpreviewEntity> wrapper);

   	

}

