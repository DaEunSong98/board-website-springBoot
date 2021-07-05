package com.page.demo.board.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.page.demo.board.dto.BoardDTO;
import com.page.demo.board.dto.PagingDTO;
import com.page.demo.board.mapper.BoardMapper;
import com.page.demo.board.paging.Criteria;

@Service
public class BoardService {

	@Autowired
	BoardMapper mapper;
	
	
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
		System.out.println("prev:"+dto.getPrev());
		System.out.println("next"+dto.getNext());
		System.out.println("next"+dto.getStartPage());
		System.out.println("next"+dto.getEndPage());
		
		
		//list=mapper.listWithPaging(criteria);
		model.addAttribute("list",list);
	}


	public void view(int idx, Model model) {
		// TODO Auto-generated method stub
		BoardDTO dto=mapper.selectIdx(idx);
		dto.setHit(dto.getHit()+1);
		mapper.updateHit(dto);
		dto=mapper.selectIdx(idx);
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


	
	

}
