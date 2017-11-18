package com.orderingSystem.util;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {

	/** 页码*/
	private int pageNum = 1;
	/** 每页条数*/
	private int pageSize = 5;
	/** 总条数*/
	private long count = 0;
	/** 页数*/
	private int pageCount;
	
	private Class<T> clazz;
	
	
	public Class<T> getClazz() {
		return clazz;
	}


	public void setClazz(Class<T> clazz) {
		this.clazz = clazz;
	}

	private List<T> list = new ArrayList<T>();
	
	public int getPageCount() {
		return pageCount;
	}
	

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public boolean isFirstPage() {
		if(this.pageNum == 1) {
			return true;
		}
		return false;
	}
	public boolean isLastPage() {
		if((this.count%this.pageSize) == 0 
				&& this.pageNum == this.count/this.pageSize) {
			return true;
		}
		if(this.count%this.pageSize > 0 
				&& this.pageNum == (this.count/this.pageSize + 1)) {
			return true;
			}
		return false;
	}
	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
}
