package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ChaptertushushikanEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ChaptertushushikanVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ChaptertushushikanView;


/**
 * 图书试看章节
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:34
 */
public interface ChaptertushushikanService extends IService<ChaptertushushikanEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ChaptertushushikanVO> selectListVO(Wrapper<ChaptertushushikanEntity> wrapper);
   	
   	ChaptertushushikanVO selectVO(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);
   	
   	List<ChaptertushushikanView> selectListView(Wrapper<ChaptertushushikanEntity> wrapper);
   	
   	ChaptertushushikanView selectView(@Param("ew") Wrapper<ChaptertushushikanEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ChaptertushushikanEntity> wrapper);

   	

}

