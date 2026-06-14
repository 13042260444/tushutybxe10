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


import com.dao.BookinformationforecastDao;
import com.entity.BookinformationforecastEntity;
import com.service.BookinformationforecastService;
import com.entity.vo.BookinformationforecastVO;
import com.entity.view.BookinformationforecastView;

@Service("bookinformationforecastService")
public class BookinformationforecastServiceImpl extends ServiceImpl<BookinformationforecastDao, BookinformationforecastEntity> implements BookinformationforecastService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookinformationforecastEntity> page = this.selectPage(
                new Query<BookinformationforecastEntity>(params).getPage(),
                new EntityWrapper<BookinformationforecastEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookinformationforecastEntity> wrapper) {
		  Page<BookinformationforecastView> page =new Query<BookinformationforecastView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookinformationforecastVO> selectListVO(Wrapper<BookinformationforecastEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookinformationforecastVO selectVO(Wrapper<BookinformationforecastEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookinformationforecastView> selectListView(Wrapper<BookinformationforecastEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookinformationforecastView selectView(Wrapper<BookinformationforecastEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<BookinformationforecastEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<BookinformationforecastEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<BookinformationforecastEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
