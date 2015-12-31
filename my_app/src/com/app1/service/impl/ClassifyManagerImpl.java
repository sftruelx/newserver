package com.app1.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app1.dao.ClassifyDao;
import com.app1.model.Classify;
import com.app1.service.ClassifyManager;
import com.app1.util.Pager;

@Service("ClassifyManager")
public class ClassifyManagerImpl  extends GenericManagerImpl<Classify, Long> implements ClassifyManager{
	
	@Autowired
	 ClassifyDao dao;

	    @Autowired
	    public ClassifyManagerImpl(ClassifyDao classifyDao) {
	        super(classifyDao);
	        this.dao = classifyDao;
	    }

	    /**
	     * {@inheritDoc}
	     */

	    public Pager getClassifies(int pageNo, int pageSize, Map map) {
	        return dao.getClassifies(pageNo, pageSize, map);
	    }


}
