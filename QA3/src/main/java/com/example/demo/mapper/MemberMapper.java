package com.example.demo.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVO;


@Mapper
public interface MemberMapper {
	
	public int joinMember(MemberVO memberVO);
	public int updateMember(MemberVO memberVO);
	public int deleteMember(MemberVO memberVO);
	public MemberVO selectMember(MemberVO memberVO);
	public int getIdCheck(MemberVO memberVO);
}
