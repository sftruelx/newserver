package com.app1.util;

import java.util.List;

public class Pager {

	private int pageSize;
	private int page;
	private int total;
	private Object rows;
	public Pager(int page, int pageSize,int  total,Object rows){
		this.page = page;
		this.pageSize = pageSize;
		this.total = total;
		this.rows = rows;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Object getRows() {
		return rows;
	}
	public void setRows(List<Object> rows) {
		this.rows = rows;
	}


	
	
}
