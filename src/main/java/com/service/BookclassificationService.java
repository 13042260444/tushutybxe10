package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookclassificationEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookclassificationVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookclassificationView;


/**
 * 图书分类
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookclassificationService extends IService<BookclassificationEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookclassificationVO> selectListVO(Wrapper<BookclassificationEntity> wrapper);
   	
   	BookclassificationVO selectVO(@Param("ew") Wrapper<BookclassificationEntity> wrapper);
   	
   	List<BookclassificationView> selectListView(Wrapper<BookclassificationEntity> wrapper);
   	
   	BookclassificationView selectView(@Param("ew") Wrapper<BookclassificationEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookclassificationEntity> wrapper);

   	

}

