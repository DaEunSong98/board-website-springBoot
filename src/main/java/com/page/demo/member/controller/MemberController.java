package com.page.demo.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.page.demo.member.dto.MemberDTO;
import com.page.demo.member.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MemberService ms;

	@GetMapping("home")
	public String Gethome(){
		return "redirect:/home";
	}
	
	@PostMapping("home")
	public String Posthome(){
		return "Member/Home";
	}
	
	@ResponseBody
	@PostMapping("idChk")
	public int PostidChk(@RequestParam("id")String id) {
		
		return ms.idCheck(id);
	}
	
	@ResponseBody
	@GetMapping("idChk")
	public int GetidChk(String id) {
		
		return ms.idCheck(id);
	}
	
	
	@GetMapping("join")
	public String GetJoinMember(){
		return "Member/join";
	}
	
	@PostMapping("join")
	public String PostJoinMember(@RequestParam("pw_check")String pw_check,
			@Valid MemberDTO dto, BindingResult result, Model model){
	
		/*if(result.hasErrors()) {
			List<ObjectError>list=result.getAllErrors();
			for(ObjectError error: list)
				System.out.println("1. "+error);
		}
		*/
		//비밀번호 일치 여부
		if(result.hasErrors()) {
			Map<String, String> validResult=ms.validateHandling(result);
			model.addAttribute("dto",dto);
			for(String key: validResult.keySet()) {
				model.addAttribute(key,validResult.get(key));
				System.out.println(key);
				System.out.println(validResult.get(key));
			}
		}
		
		else {
			if(dto.getPw().equals(pw_check)){
					ms.insert(dto);	
					model.addAttribute("checkingValue","false");

			}
			else {
				model.addAttribute("dto",dto);
				//비밀번호 불일치는 일단 모르겠다....
			}
		}
			
		return "Member/login";
	}
	
	
	@GetMapping("login")
	public String GetLoginMember(){
		return "Member/login";
	}
	
	@PostMapping("login")
	public String PostLoginMember(MemberDTO dto, HttpSession session){
			ms.login(dto.getId(),dto.getPw(), session);
		return "Member/login";
	}

	

	@GetMapping("update")
	public String GetUpdateMember(){
		return "Member/update";
	}
	
	@PostMapping("update")
	public String PostUpdateMember(MemberDTO dto, HttpSession session){
			MemberDTO tmp=(MemberDTO)session.getAttribute("member");
			System.out.println(tmp.getId());
			dto.setId(tmp.getId());
			ms.update(dto);
		return "Home";
	}
	
	
	@GetMapping("logout")
	public String LogoutMember(HttpSession session) {
		session.invalidate();
		return "Member/logout";
	}
	
	
	@GetMapping("delete")
	public String GetDeleteMember(){
		return "Member/delete";
	}
	
	@PostMapping("delete")
	public String PostDeleteMember(@RequestParam(value="pw")String pw, @RequestParam(value="pw_check")String pw_check, HttpSession session
			,RedirectAttributes rttr) {
			MemberDTO tmp=(MemberDTO)session.getAttribute("member");
			if(!tmp.getPw().equals(pw)) {
				rttr.addFlashAttribute("result",true);
				return "redirect:/member/delete";
			}
			else {
				 if(!pw.equals(pw_check)) {
					 rttr.addFlashAttribute("result",false);
					 return "redirect:/member/delete";
				 }
				 
				 else ms.delete(tmp.getId());
					 
			}
			return "redirect:/member/logout";
	}
}
