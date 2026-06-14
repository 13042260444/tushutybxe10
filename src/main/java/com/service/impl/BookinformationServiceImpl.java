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


import com.dao.BookinformationDao;
import com.entity.BookinformationEntity;
import com.service.BookinformationService;
import com.entity.vo.BookinformationVO;
import com.entity.view.BookinformationView;

@Service("bookinformationService")
public class BookinformationServiceImpl extends ServiceImpl<BookinformationDao, BookinformationEntity> implements BookinformationService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookinformationEntity> page = this.selectPage(
                new Query<BookinformationEntity>(params).getPage(),
                new EntityWrapper<BookinformationEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookinformationEntity> wrapper) {
		  Page<BookinformationView> page =new Query<BookinformationView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookinformationVO> selectListVO(Wrapper<BookinformationEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookinformationVO selectVO(Wrapper<BookinformationEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookinformationView> selectListView(Wrapper<BookinformationEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookinformationView selectView(Wrapper<BookinformationEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<BookinformationEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<BookinformationEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<BookinformationEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
