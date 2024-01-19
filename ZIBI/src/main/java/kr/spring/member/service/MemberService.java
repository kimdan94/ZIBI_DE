package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	
	
	
	public void registerMember(MemberVO memberVO);
	
	
	public MemberVO selectMember(String mem_email);

	public MemberVO checkNickname(String mem_nickname);
	
	public void updateMemberDetail(MemberVO memberVO);
}
