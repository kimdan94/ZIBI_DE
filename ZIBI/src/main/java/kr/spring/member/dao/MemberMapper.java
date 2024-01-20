package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	@Select("SELECT member_seq.nextval FROM dual")
	public int createMemNum();
	
	@Insert("INSERT INTO member (mem_num,mem_email) VALUES (#{mem_num},#{mem_email})")
	public void insertMember(MemberVO memberVO);
	
	@Insert("INSERT INTO member_detail (mem_num,mem_nickname,mem_password) VALUES (#{mem_num},#{mem_nickname},#{mem_password})")
	public void insertMemberDetail(MemberVO memberVO);
	
	@Select("SELECT * FROM member JOIN member_detail USING (mem_num) WHERE mem_email=#{mem_email}")
	public MemberVO selectMember(String mem_email);

	@Select("SELECT * FROM member_detail WHERE mem_nickname=#{mem_nickname}")
	public MemberVO checkNickname(String mem_nickname);
	
	@Select("SELECT * FROM member_detail WHERE mem_phone=#{mem_phone}")
	public MemberVO checkPhone(String mem_phone);
	
	@Update("UPDATE member_detail SET mem_nickname=#{mem_nickname},mem_name=#{mem_name},mem_phone=#{mem_phone},mem_zipcode=#{mem_zipcode},mem_address1=#{mem_address1},mem_address2=#{mem_address2},mem_modidate=SYSDATE WHERE mem_num=#{mem_num}")
	public void updateMemberDetail(MemberVO memberVO);
	
}
