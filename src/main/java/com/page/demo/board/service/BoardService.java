package com.page.demo.board.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.page.demo.board.dto.BoardDTO;
import com.page.demo.board.dto.PagingDTO;
import com.page.demo.board.mapper.BoardMapper;
import com.page.demo.board.mapper.CommentMapper;
import com.page.demo.board.paging.Criteria;

@Service
public class BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Autowired 
	CommentMapper mapper2;
	
	static private int num=1;
	
	public void insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		
		dto.setWdate(new Timestamp(System.currentTimeMillis()));
		dto.setIdx(num++);
		dto.setHit(1);
		mapper.insert(dto);
	}


	public void list(Model model,Criteria criteria) {
		// TODO Auto-generated method stub

		ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
		PagingDTO dto=new PagingDTO(criteria,mapper.count());
		list=mapper.list(criteria);
		model.addAttribute("pageMaker",dto);
		System.out.println("게시판 페이지: "+criteria.getPageNo());
		System.out.println("prev:"+dto.getPrev());
		System.out.println("next"+dto.getNext());
		System.out.println("next"+dto.getStartPage());
		System.out.println("next"+dto.getEndPage());
		
		
		//list=mapper.listWithPaging(criteria);
		model.addAttribute("list",list);
	}


	//댓글을 위한 pageMaker가 포함된 함수
	public void view(int idx, Model model,Criteria criteria) {
		// TODO Auto-generated method stub
	
		BoardDTO dto=mapper.selectIdx(idx);
		dto.setHit(dto.getHit()+1);
		mapper.updateHit(dto);
		model.addAttribute("dto",dto);
		model.addAttribute("count",mapper2.count(idx));
		PagingDTO pdto=new PagingDTO(criteria,mapper2.count(idx));
		model.addAttribute("pageMaker",pdto);
	}

	//update를 위한 함수 
	public void view(int idx, Model model) {
		// TODO Auto-generated method stub
		BoardDTO dto=mapper.selectIdx(idx);
		model.addAttribute("dto",dto);
	}
	

	public void update(BoardDTO dto) {
		// TODO Auto-generated method stub
		mapper.update(dto);
	}


	public void delete(int idx) {
		// TODO Auto-generated method stub
		mapper.delete(idx);
	}


	public void search(String search,Model model2) {
		// TODO Auto-generated method stub
		search='%'+search+'%';
		model2.addAttribute("list",mapper.search(search));
	}


	
	

}
