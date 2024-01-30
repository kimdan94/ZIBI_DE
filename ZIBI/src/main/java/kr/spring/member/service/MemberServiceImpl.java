package kr.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.FollowVO;
import kr.spring.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	/*---------회원 가입----------*/
	@Override
	public int createMemNum() {
		return memberMapper.createMemNum();
	}
	
	@Override
	public void registerMember(MemberVO memberVO) {
		memberMapper.insertMember(memberVO);
		memberMapper.insertMemberDetail(memberVO);
	}
	
	/*---------회원 정보----------*/
	@Override
	public MemberVO selectMember(int mem_num) {
		return memberMapper.selectMember(mem_num);
	}
	
	
	/*---------회원 정보 유효성 체크----------*/
	@Override
	public MemberVO checkEmail(String mem_email) {
		return memberMapper.checkEmail(mem_email);
	}

	@Override
	public MemberVO checkNickname(String mem_nickname) {
		return memberMapper.checkNickname(mem_nickname);
	}
	
	@Override
	public MemberVO checkPhone(String mem_phone) {
		return memberMapper.checkPhone(mem_phone);
	}

	
	/*---------회원 정보 수정----------*/
	@Override
	public void updateMemberDetail(MemberVO memberVO) {
		memberMapper.updateMemberDetail(memberVO);
	}

	@Override
	public void updateProfileImages(MemberVO memberVO) {
		memberMapper.updateProfileImages(memberVO);
	}
	
	@Override
	public void updatePassword(MemberVO memberVO) {
		memberMapper.updatePassword(memberVO);		
	}
	
	/*---------회원 탈퇴----------*/
	@Override
	public void quitMember(int mem_num) {
		memberMapper.quitMemberDetail(mem_num);
		memberMapper.quitMember(mem_num);
	}
	/*---------회원 팔로우----------*/
	@Override
	public FollowVO selectFollow(FollowVO followVO) {
		return memberMapper.selectFollow(followVO);
	}
	
	@Override
	public void followMember(FollowVO followVO){
		memberMapper.followMember(followVO);
	}

	@Override
	public void unfollowMember(FollowVO followVO) {
		memberMapper.unfollowMember(followVO);
	}

	@Override
	public int followCount(int mem_num) {
		return memberMapper.followCount(mem_num);
	}

}
