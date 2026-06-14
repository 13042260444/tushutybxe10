package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BookinformationEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BookinformationVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BookinformationView;


/**
 * 图书信息
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:33
 */
public interface BookinformationService extends IService<BookinformationEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BookinformationVO> selectListVO(Wrapper<BookinformationEntity> wrapper);
   	
   	BookinformationVO selectVO(@Param("ew") Wrapper<BookinformationEntity> wrapper);
   	
   	List<BookinformationView> selectListView(Wrapper<BookinformationEntity> wrapper);
   	
   	BookinformationView selectView(@Param("ew") Wrapper<BookinformationEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BookinformationEntity> wrapper);

   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<BookinformationEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<BookinformationEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<BookinformationEntity> wrapper);



}

