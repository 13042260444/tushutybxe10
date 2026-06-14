package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussbookinformationEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussbookinformationVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussbookinformationView;


/**
 * 图书信息
 *
 * @author 
 * @email 
 * @date 2026-05-13 17:46:36
 */
public interface DiscussbookinformationService extends IService<DiscussbookinformationEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussbookinformationVO> selectListVO(Wrapper<DiscussbookinformationEntity> wrapper);
   	
   	DiscussbookinformationVO selectVO(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);
   	
   	List<DiscussbookinformationView> selectListView(Wrapper<DiscussbookinformationEntity> wrapper);
   	
   	DiscussbookinformationView selectView(@Param("ew") Wrapper<DiscussbookinformationEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussbookinformationEntity> wrapper);

   	

}

