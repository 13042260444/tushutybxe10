package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookinformationforecastEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookinformationforecastVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookinformationforecastView;


/**
 * 销量预测
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface BookinformationforecastService extends IService<BookinformationforecastEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookinformationforecastVO> selectListVO(Wrapper<BookinformationforecastEntity> wrapper);
   	
   	BookinformationforecastVO selectVO(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);
   	
   	List<BookinformationforecastView> selectListView(Wrapper<BookinformationforecastEntity> wrapper);
   	
   	BookinformationforecastView selectView(@Param("ew") Wrapper<BookinformationforecastEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookinformationforecastEntity> wrapper);

   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<BookinformationforecastEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<BookinformationforecastEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<BookinformationforecastEntity> wrapper);



}

