package com.page.demo.board.dto;

import com.page.demo.board.paging.Criteria;

public class PagingDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private int total;
	private Criteria criteria;
	
	public PagingDTO(Criteria criteria, int total) {
		
		this.criteria=criteria;
		this.total=total;
		
		this.endPage=(int) ((Math.ceil(criteria.getPageNo()/2.0))*2);
		this.startPage=this.endPage-1;
		
		 int realEnd = (int)(Math.ceil((total*1.0)/criteria.getCountPerp()));
		
		 
		 if(realEnd < this.endPage){
	        	this.endPage = realEnd;
	        }
		 System.out.println(realEnd);
		 //1보다 크면 이전 페이지가 무조건 존재한다는 의미 
		 this.prev = this.startPage > 1;
	     this.next = this.endPage < realEnd;
	        
	        
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean getPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	
	
}
