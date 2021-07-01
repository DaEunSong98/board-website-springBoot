package com.page.demo.board.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.page.demo.board.dto.CommentDTO;
import com.page.demo.board.mapper.CommentMapper;

@Service
public class CommentService {

	static private int idx=1;
	
	@Autowired
	CommentMapper mapper;
	
	public ArrayList<CommentDTO> list() {
		// TODO Auto-generated method stub
	
		return mapper.list();
	}

	public void insert(CommentDTO dto) {
		// TODO Auto-generated method stub
		dto.setWdate(new Timestamp(System.currentTimeMillis()));
		dto.setIdx(idx++);
		System.out.println(dto.getContent());
		System.out.println(dto.getIdx());
		System.out.println(dto.getWdate());
		
		//임시로 board_idx 지정
		dto.setBoard_idx(41);
		mapper.insert(dto);
	}

	public void update(CommentDTO dto) {
		// TODO Auto-generated method stub
		mapper.update(dto);
	}

	public void delete() {
		// TODO Auto-generated method stub
		mapper.delete();
	}

}
