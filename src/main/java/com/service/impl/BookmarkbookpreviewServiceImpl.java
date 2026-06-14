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


import com.dao.BookmarkbookpreviewDao;
import com.entity.BookmarkbookpreviewEntity;
import com.service.BookmarkbookpreviewService;
import com.entity.vo.BookmarkbookpreviewVO;
import com.entity.view.BookmarkbookpreviewView;

@Service("bookmarkbookpreviewService")
public class BookmarkbookpreviewServiceImpl extends ServiceImpl<BookmarkbookpreviewDao, BookmarkbookpreviewEntity> implements BookmarkbookpreviewService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookmarkbookpreviewEntity> page = this.selectPage(
                new Query<BookmarkbookpreviewEntity>(params).getPage(),
                new EntityWrapper<BookmarkbookpreviewEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookmarkbookpreviewEntity> wrapper) {
		  Page<BookmarkbookpreviewView> page =new Query<BookmarkbookpreviewView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookmarkbookpreviewVO> selectListVO(Wrapper<BookmarkbookpreviewEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookmarkbookpreviewVO selectVO(Wrapper<BookmarkbookpreviewEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookmarkbookpreviewView> selectListView(Wrapper<BookmarkbookpreviewEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookmarkbookpreviewView selectView(Wrapper<BookmarkbookpreviewEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
