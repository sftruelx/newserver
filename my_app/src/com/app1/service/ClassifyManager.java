package com.app1.service;

import java.util.Map;

import com.app1.util.Pager;

public interface ClassifyManager {
	
	
	 public Pager getClassifies(int pageNo, int pageSize, Map map) ;

}