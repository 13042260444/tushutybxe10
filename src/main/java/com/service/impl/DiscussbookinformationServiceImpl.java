package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscussbookinformationDao;
import com.entity.DiscussbookinformationEntity;
import com.service.DiscussbookinformationService;
import com.entity.vo.DiscussbookinformationVO;
import com.entity.view.DiscussbookinformationView;

@Service("discussbookinformationService")
public class DiscussbookinformationServiceImpl extends ServiceImpl<DiscussbookinformationDao, DiscussbookinformationEntity> implements DiscussbookinformationService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussbookinformationEntity> page = this.selectPage(
                new Query<DiscussbookinformationEntity>(params).getPage(),
                new EntityWrapper<DiscussbookinformationEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussbookinformationEntity> wrapper) {
		  Page<DiscussbookinformationView> page =new Query<DiscussbookinformationView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<DiscussbookinformationVO> selectListVO(Wrapper<DiscussbookinformationEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussbookinformationVO selectVO(Wrapper<DiscussbookinformationEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussbookinformationView> selectListView(Wrapper<DiscussbookinformationEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussbookinformationView selectView(Wrapper<DiscussbookinformationEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
