package kr.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void registerMember(MemberVO memberVO) {
		memberVO.setMem_num(memberMapper.createMemNum());
		memberMapper.insertMember(memberVO);
		memberMapper.insertMemberDetail(memberVO);
	}

	@Override
	public MemberVO selectMember(String mem_email) {
		return memberMapper.selectMember(mem_email);
	}

	@Override
	public MemberVO checkNickname(String mem_nickname) {
		return memberMapper.checkNickname(mem_nickname);
	}

	@Override
	public void updateMemberDetail(MemberVO memberVO) {
		memberMapper.updateMemberDetail(memberVO);
	}

	

}
