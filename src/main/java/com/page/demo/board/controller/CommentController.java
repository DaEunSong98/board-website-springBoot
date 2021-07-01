package com.page.demo.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@GetMapping("list")
	public ArrayList<CommentDTO> ComentList() {
		
		return cs.list();
	}
	
	@GetMapping("insert")
	public String GetComentInsert(CommentDTO dto) {
		
		return "Board/Comment/insert";
	}
	@ResponseBody
	@PostMapping("insert")
	public String PostComentInsert(CommentDTO dto, HttpSession session) {
		MemberDTO tmp=(MemberDTO) session.getAttribute("member");
		dto.setWriter(tmp.getId());
		System.out.println(dto.getWriter());
		
		return cs.insert(dto);
	}
	
	@GetMapping("update")
	public String ComentUpdate(CommentDTO dto) {
		 cs.update(dto);	
		return "";
	}
	
	@GetMapping("delete")
	public String ComentDelete() {
		 cs.delete();	
		return "";
	}
	
	
}
