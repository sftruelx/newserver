package com.app1.service;

import java.util.List;
import java.util.Map;

import com.app1.model.Classify;
import com.app1.util.Pager;

public interface ClassifyManager {
	
	
	 public Pager getClassifies(int pageNo, int pageSize, Map map) ;
	 
	 public Classify saveClassify(Classify classify);

	 public List getLevel();
	 
	 public void removeClassify(long id);
	 
	 public List<Classify> getParent(Long parent_id);
}