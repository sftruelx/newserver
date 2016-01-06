package com.app1.service.impl;

import java.util.List;
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
	    public Classify saveClassify(Classify classify){
	    	return dao.save(classify);
	    }
	    
	    public List getLevel(){
	    	return  dao.getLevel();
	    }
	    
	    public List getParent(Long parent_id){
	    	return  dao.getParent(parent_id);
	    }
	    
	    public void removeClassify(long id){
	    	dao.remove(id);
	    }
	    public Classify getClassify(long id){
	    	return dao.get(id);
	    }

}
