package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.LoginService;
import com.example.demo.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	@PostMapping("/checkMember.do")
	@ResponseBody
	public int checkMember(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(id);
		memberVO.setPw(pw);
		
		int result = loginService.getLoginCheck(memberVO);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		
		return result;
	}
	@GetMapping("/logout.do")
	public String loginOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "index";
	}
	@GetMapping("/findId.do")
	public String findId() {
		
		
		return "findId";
	}
	@GetMapping("/udtPass.do")
	public String udtPass() {
		return "udtPass";
	}
	@PostMapping("/findInfo.do")
	@ResponseBody
	public String findIdInfo(HttpServletRequest request) {
		
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		
		System.out.println(name+birth);
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setName(name);
		memberVO.setBirth(birth);
		
		String result = loginService.findId(memberVO);
		System.out.println(result);
		if(result == null || result == "") {
			result = "정보없음";
			return result;
		}
		else {
			return result;
		}
		
		
		
	}
	@PostMapping("/userCheck.do")
	@ResponseBody
	public int userCheck(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		System.out.println(name+id);
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setName(name);
		memberVO.setId(id);
		
		int result = loginService.findUser(memberVO);
		System.out.println(result);
			
		return result;
		
	}
	
	 @PostMapping("/passUdt.do")
	 @ResponseBody
	 public String passUdt(HttpServletRequest request, ModelMap modelMap) {
		 
		 String id = request.getParameter("hiddenID");
	 
		 String pw = request.getParameter("pw");
		 
		 MemberVO memberVO = new MemberVO();
		 memberVO.setId(id);
		 memberVO.setPw(pw);
	  
		 int resultInt = loginService.passUdt(memberVO);
		 
		 String result = ""+resultInt;
		 return result; 
	}
	
	 @PostMapping("/kakaoLogin.do")
	 @ResponseBody
	 public String kakaoLogin(HttpServletRequest request, ModelAndView modelAndView) {
		 
		 String result = "";  
		 return result; 
	}
	

	
}
