package com.page.demo.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.page.demo.board.dto.CommentDTO;
import com.page.demo.board.service.CommentService;
import com.page.demo.member.dto.MemberDTO;

@Controller
@RequestMapping("/comment/")
public class CommentController {


	@Autowired
	CommentService cs;
	

	@ResponseBody
	@PostMapping("list")
	public ArrayList<CommentDTO> ComentList(@RequestParam("board_idx")int board_idx,Model model) {
		
		return cs.list(board_idx);
	}
	
	@GetMapping("insert")
	public String GetComentInsert(@RequestParam("board_idx")int board_idx,Model model) {
		model.addAttribute("board_idx",board_idx);
		return "Board/Comment/insert";
	}
	
	@ResponseBody
	@PostMapping("insert")
	public String PostComentInsert(CommentDTO dto, HttpSession session,Model model) {
		MemberDTO tmp=(MemberDTO) session.getAttribute("member");
		dto.setWriter(tmp.getId());
		System.out.println(dto.getWriter());
		
		return cs.insert(dto);
	}
	
	@GetMapping("update")
	public String ComentUpdate(CommentDTO dto) {
		System.out.println(dto.getIdx());
		System.out.println(dto.getContent());
		 cs.update(dto);	
		return "Member/Comment/insert";
	}
	
	@ResponseBody
	@PostMapping("update")
	public String PostComentUpdate(CommentDTO dto) {
		
		return cs.update(dto);
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String ComentDelete(@RequestParam("idx")int idx) {
		
		return cs.delete(idx);
	}
	
	
}
