package com.page.demo.board.dto;

import java.sql.Timestamp;
import java.util.Date;

public class BoardDTO {

	int idx;
	String writer;
	String title;
	String contents;
	Timestamp Wdate;
	int hit;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWdate() {
		return Wdate;
	}
	public void setWdate(Timestamp wdate) {
		Wdate = wdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	
	
	
}