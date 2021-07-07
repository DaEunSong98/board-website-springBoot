package com.page.demo.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.page.demo.board.dto.CommentDTO;
import com.page.demo.board.paging.Criteria;

@Repository
@Mapper
public interface CommentMapper {

	//@Select("select * from comments where board_idx=#{board_idx} order by idx")
	//public ArrayList<CommentDTO> list(int board_idx);

	
	@Insert("insert into comments values(comment_idx_seq.nextval,#{board_idx},#{writer},#{content},#{wdate})")
	public boolean insert(CommentDTO dto);

	@Update("update comments set content=#{content} where idx=#{idx}")
	public boolean update(CommentDTO dto);

	@Delete("delete from comments where idx=#{idx}")
	public void delete(int idx);


	@Select("\r\n" + 
			"select * from\r\n" + 
			"(select rownum rnum, writer, content, idx from\r\n" + 
			"(select * from comments where board_idx=${board_idx} order by idx)\r\n" + 
			"where rownum<=${criteria.pageNo}*${criteria.countPerp})\r\n" + 
			"where rnum>=(${criteria.pageNo}-1)*${criteria.countPerp}")
	public ArrayList<CommentDTO> list(@Param("board_idx")int board_idx,@Param("criteria")Criteria criteria);

	@Select ("select count(*) from comments where board_idx=#{idx}") 
	public int count(int idx);

	
}
