package com.example.demo.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVO;


@Mapper
public interface LoginMapper {
	
	public int getLoginCheck(MemberVO memberVO);
	public String findId(MemberVO memberVO);
	public int findUser(MemberVO memberVO);
	public int passUdt(MemberVO memberVO);
}
