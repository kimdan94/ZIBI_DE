package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.FollowVO;
import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	/*---------회원 가입----------*/
	@Select("SELECT member_seq.nextval FROM dual")
	public int createMemNum();
	
	public void insertMember(MemberVO memberVO);
	
	public void insertMemberDetail(MemberVO memberVO);
	
	/*---------회원 정보----------*/
	@Select("SELECT * FROM member JOIN member_detail USING (mem_num) WHERE mem_num=#{mem_num}")
	public MemberVO selectMember(int mem_num);
	
	/*---------회원 정보 유효성 체크----------*/
	@Select("SELECT * FROM member JOIN member_detail USING (mem_num) WHERE mem_email=#{mem_email}")
	public MemberVO checkEmail(String mem_email);

	@Select("SELECT * FROM member_detail WHERE mem_nickname=#{mem_nickname}")
	public MemberVO checkNickname(String mem_nickname);
	
	@Select("SELECT * FROM member_detail WHERE mem_phone=#{mem_phone}")
	public MemberVO checkPhone(String mem_phone);
	
	/*---------회원 정보 수정----------*/
	public void updateMemberDetail(MemberVO memberVO);
	
	@Update("UPDATE member_detail SET mem_photoname=#{mem_photoname}, mem_photo=#{mem_photo} WHERE mem_num=#{mem_num}")
	public void updateProfileImages(MemberVO memberVO);
	
	@Update("UPDATE member_detail SET mem_password=#{mem_password} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO memberVO);
	
	/*---------회원 탈퇴----------*/
	@Delete("DELETE FROM member where mem_num=#{mem_num}")
	public void quitMember(int mem_num);
	
	@Delete("DELETE FROM member_detail where mem_num=#{mem_num}")
	public void quitMemberDetail(int mem_num);
	
	/*---------회원 팔로우/언팔로우----------*/
	@Select("SELECT * FROM follow JOIN member USING(mem_num) WHERE mem_num=#{mem_num} AND fmem_num=#{fmem_num}") //회원의 팔로우 목록을 불러옴
	public FollowVO selectFollow(FollowVO followVO);
	
	@Select("SELECT COUNT(*) FROM follow WHERE mem_num=#{mem_num}") //회원의 팔로우 수를 불러옴
	public int followCount(int mem_num);
	
	@Insert("INSERT INTO follow (mem_num,fmem_num) VALUES (#{mem_num},#{fmem_num})") //팔로잉
	public void followMember(FollowVO followVO);
	
	@Delete("DELETE FROM follow WHERE mem_num=#{mem_num} AND fmem_num=#{fmem_num}") //언팔로우
	public void unfollowMember(FollowVO followVO);
	
	
}
