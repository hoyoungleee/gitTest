package com.example.demo.service;

import com.example.demo.vo.MemberVO;

public interface LoginService {

	public int getLoginCheck(MemberVO memberVO);
	public String findId(MemberVO memberVO);
	public int findUser(MemberVO memberVO);
	public int passUdt(MemberVO memberVO);
}
