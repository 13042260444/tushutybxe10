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


import com.dao.BookannouncementDao;
import com.entity.BookannouncementEntity;
import com.service.BookannouncementService;
import com.entity.vo.BookannouncementVO;
import com.entity.view.BookannouncementView;

@Service("bookannouncementService")
public class BookannouncementServiceImpl extends ServiceImpl<BookannouncementDao, BookannouncementEntity> implements BookannouncementService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookannouncementEntity> page = this.selectPage(
                new Query<BookannouncementEntity>(params).getPage(),
                new EntityWrapper<BookannouncementEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BookannouncementEntity> wrapper) {
		  Page<BookannouncementView> page =new Query<BookannouncementView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BookannouncementVO> selectListVO(Wrapper<BookannouncementEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BookannouncementVO selectVO(Wrapper<BookannouncementEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BookannouncementView> selectListView(Wrapper<BookannouncementEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BookannouncementView selectView(Wrapper<BookannouncementEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
