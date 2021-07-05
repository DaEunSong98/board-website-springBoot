package com.page.demo.board.paging;

public class Criteria {

	private int pageNo;
	private int countPerp;
	
	public Criteria() {
		this(1,3);
	}
	
	public Criteria(int pageNo, int countPerp) {
		this.pageNo=pageNo;
		this.countPerp=countPerp;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getCountPerp() {
		return countPerp;
	}

	public void setCountPerp(int countPerp) {
		this.countPerp = countPerp;
	}
	
	
	
}
