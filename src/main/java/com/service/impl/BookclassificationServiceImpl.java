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


import com.dao.BookclassificationDao;
import com.entity.BookclassificationEntity;
import com.service.BookclassificationService;
import com.entity.vo.BookclassificationVO;
import com.entity.view.BookclassificationView;

@Service("bookclassificationService")
public class BookclassificationServiceImpl extends ServiceImpl<BookclassificationDao, BookclassificationEntity> implements BookclassificationService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookclassificationEntity> page = this.selectPage(
                new Query<BookclassificationEntity>(params).getPage(),
                new EntityWrapper<BookclassificationEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookclassificationEntity> wrapper) {
		  Page<BookclassificationView> page =new Query<BookclassificationView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookclassificationVO> selectListVO(Wrapper<BookclassificationEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookclassificationVO selectVO(Wrapper<BookclassificationEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookclassificationView> selectListView(Wrapper<BookclassificationEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookclassificationView selectView(Wrapper<BookclassificationEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
