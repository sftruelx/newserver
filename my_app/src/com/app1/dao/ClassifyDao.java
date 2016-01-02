package com.app1.dao;

import java.util.List;
import java.util.Map;

import com.app1.model.Classify;
import com.app1.util.Pager;

public interface ClassifyDao extends GenericDao<Classify, Long>{

	
	public Pager getClassifies(int pageNo, int pageSize, Map map) ;
	
	public Classify saveClassify(Classify classify);
	
	public List getLevel();
	
	public List<Classify> getParent(Long parent_id);
}
