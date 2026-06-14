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


import com.dao.ChaptertushushikanDao;
import com.entity.ChaptertushushikanEntity;
import com.service.ChaptertushushikanService;
import com.entity.vo.ChaptertushushikanVO;
import com.entity.view.ChaptertushushikanView;

@Service("chaptertushushikanService")
public class ChaptertushushikanServiceImpl extends ServiceImpl<ChaptertushushikanDao, ChaptertushushikanEntity> implements ChaptertushushikanService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ChaptertushushikanEntity> page = this.selectPage(
                new Query<ChaptertushushikanEntity>(params).getPage(),
                new EntityWrapper<ChaptertushushikanEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ChaptertushushikanEntity> wrapper) {
		  Page<ChaptertushushikanView> page =new Query<ChaptertushushikanView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<ChaptertushushikanVO> selectListVO(Wrapper<ChaptertushushikanEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ChaptertushushikanVO selectVO(Wrapper<ChaptertushushikanEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ChaptertushushikanView> selectListView(Wrapper<ChaptertushushikanEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ChaptertushushikanView selectView(Wrapper<ChaptertushushikanEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
