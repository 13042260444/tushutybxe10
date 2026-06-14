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


import com.dao.BookpreviewDao;
import com.entity.BookpreviewEntity;
import com.service.BookpreviewService;
import com.entity.vo.BookpreviewVO;
import com.entity.view.BookpreviewView;

@Service("bookpreviewService")
public class BookpreviewServiceImpl extends ServiceImpl<BookpreviewDao, BookpreviewEntity> implements BookpreviewService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookpreviewEntity> page = this.selectPage(
                new Query<BookpreviewEntity>(params).getPage(),
                new EntityWrapper<BookpreviewEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookpreviewEntity> wrapper) {
		  Page<BookpreviewView> page =new Query<BookpreviewView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookpreviewVO> selectListVO(Wrapper<BookpreviewEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookpreviewVO selectVO(Wrapper<BookpreviewEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookpreviewView> selectListView(Wrapper<BookpreviewEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookpreviewView selectView(Wrapper<BookpreviewEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
