package com.page.demo.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.page.demo.board.dto.BoardDTO;
import com.page.demo.board.paging.Criteria;


@Mapper
@Repository
public interface BoardMapper {

	@Insert("insert into board values(board_seq.nextval, #{writer}, #{title}, #{contents}, #{Wdate},#{hit})")
	public void insert(BoardDTO dto);

	//@Select("select * from board order by idx desc ")
	//public ArrayList<BoardDTO> list();

	@Select("select * from board where idx=#{idx}")
	public BoardDTO selectIdx(int idx);

	@Update("update board set title=#{title}, contents=#{contents} where idx=#{idx}")
	public void update(BoardDTO dto);

	@Delete("delete from board where idx=#{idx}")
	public void delete(int idx);

	@Update("update board set hit=#{hit} where idx=#{idx}")
	public void updateHit(BoardDTO dtp);
	
	@Select("select \r\n" + 
			"		idx,title,wdate,writer,hit\r\n" + 
			"		from(select rownum rnum, idx,title,wdate,writer,hit" + 
			"			from board where rownum <= #{pageNo} * #{countPerp} order by idx desc)" + 
			"			where rnum>(#{pageNo}-1) * #{countPerp}")
	public ArrayList<BoardDTO> list(Criteria criteria);

	@Select ("select count(*) from board") 
	public int count();

	@Select("select * from board where title LIKE #{search} OR contents LIKE #{search} ")
	public ArrayList<BoardDTO> search (String search);
}
