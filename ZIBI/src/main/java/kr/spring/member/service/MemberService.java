package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	
	/*---------회원 가입----------*/
	public int createMemNum();
	public void registerMember(MemberVO memberVO);
	
	/*---------회원 정보----------*/
	public MemberVO selectMember(int mem_num);
	
	/*---------회원 정보 유효성 체크----------*/
	public MemberVO checkEmail(String mem_email);
	public MemberVO checkNickname(String mem_nickname);
	public MemberVO checkPhone(String mem_phone);
	
	/*---------회원 정보 수정----------*/
	public void updateMemberDetail(MemberVO memberVO);
	public void updateProfileImages(MemberVO memberVO);
	
}
