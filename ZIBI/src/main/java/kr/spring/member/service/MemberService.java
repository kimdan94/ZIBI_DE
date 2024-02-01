package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import kr.spring.member.vo.ActListVO;
import kr.spring.member.vo.DealListVO;
import kr.spring.member.vo.FollowListVO;
import kr.spring.member.vo.FollowVO;
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
	public void updatePassword(MemberVO memberVO);
	
	/*---------회원 탈퇴----------*/
	public void quitMember(int mem_num);
	
	
	/*---------회원 팔로우----------*/
	public FollowVO selectFollow(FollowVO followVO);
	public void followMember(FollowVO followVO);
	public void unfollowMember(FollowVO followVO);
	public int followCount(int mem_num);
	public int selectFollowByFmem_numCount(int fmem_num);
	public List<FollowVO> selectFollowByFmem_num(int fmem_num);
	
	/*---------회원 내역----------*/
	//거래 내역
	public List<DealListVO> selectDealList(Map<String,Object> map);
	//거래 내역 수 
	public int selectDealCount(Map<String,Object> map);
	//활동 내역
	public List<ActListVO> selectActList(Map<String,Object> map);
	//활동 내역 수
	public int selectActCount(Map<String,Object> map);
	//팔로우 목록
	public List<FollowListVO> selectFollowList(Map<String,Integer> map);
	//팔로우 수
	public int selectFollowCount(int fmem_num);
	
	/*---------오픈 프로필----------*/
	//오픈 프로필 글 개수
	public int selectOpenCount(int mem_num);
	//오픈 프로필 글
	public List<FollowListVO> selectOpenList(Map<String,Integer> map);
		
}
