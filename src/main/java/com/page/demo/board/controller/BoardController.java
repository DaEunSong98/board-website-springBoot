package com.page.demo.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.page.demo.board.dto.BoardDTO;
import com.page.demo.board.paging.Criteria;
import com.page.demo.board.service.BoardService;
import com.page.demo.board.service.CommentService;
import com.page.demo.member.dto.MemberDTO;

@Controller
public class BoardController {

	@Autowired
	BoardService bs;
	
	@GetMapping("index")
	public String index() {
	
	return "index";

}
	
	
	@GetMapping("home")
		public String Home() {
		
		return "Home";

	}
	
	@GetMapping("/board/list")
	public String ListBoard(Model model,Criteria criteria) {
		bs.list(model,criteria);
		return "Board/list";
	}
	
	
	@GetMapping("/board/insert")
	public String GetInsertBoard() {
		return "Board/insert";
	}
	
	@PostMapping("/board/insert")
	public String PostInsertBoard(BoardDTO dto ,HttpSession session) {
		try {
			MemberDTO member=(MemberDTO) session.getAttribute("member");
				dto.setWriter(member.getId());
				bs.insert(dto);
		}
		catch(DataAccessException e) {} //데이터베이스 처리 과정에 문제
		catch(Exception e) {} 	//시스템에 문제 
		return "redirect:list";
	}
	
	@GetMapping("/board/view")
	public String GetViewBoard(@RequestParam("idx") int idx, Model model,Criteria criteria) {
		bs.view(idx,model,criteria);
		return "Board/view";
	}
	
	@GetMapping("/board/update")
	public String GetUpdateBoard(@RequestParam("idx") int idx, Model model) {
		bs.view(idx, model);
		return "Board/update";
	}
	
	@PostMapping("/board/update")
	public String PostUpdateBoard(BoardDTO dto,Model model) {
		bs.update(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/board/delete")
	public String GetDeleteBoard(@RequestParam("idx") int idx) {
		bs.delete(idx);
		
		return "Board/delete";
	}
	

	@PostMapping("/board/search")
	public String SearchBoard(@RequestParam("keyword")String search,Model model2) {
		bs.search(search,model2);
		return "redirect:/board/list/1";
	}
	
		
	
}