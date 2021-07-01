package com.page.demo.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.page.demo.board.dto.CommentDTO;

@Repository
@Mapper
public interface CommentMapper {

	
	public ArrayList<CommentDTO> list();

	@Insert("insert into comments values(#{idx},#{board_idx},#{writer},#{content},#{wdate})")
	public void insert(CommentDTO dto);

	public void update(CommentDTO dto);

	public void delete();
	
	
	
	
}
