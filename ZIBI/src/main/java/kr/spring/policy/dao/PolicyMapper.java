package kr.spring.policy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.policy.vo.PolicyVO;

@Mapper
public interface PolicyMapper {
	
	//관리자 - 행정구역 primary key
	@Select("SELECT district_seq.nextval FROM dual")
	public int selectDistrictNumber();
	
	//관리자 - 행정구역 정보 insert (district 테이블, policy 테이블)
	@Insert("INSERT INTO district (district_num,district_name,district_latitude,district_lonitude) VALUES (#{district_num},#{district_name},#{district_latitude},#{district_lonitude})")
	public void insertDistrict(PolicyVO policyVO);
	
	//관리자 - 정책 url insert
	public void insertPolicy(PolicyVO policyVO);
	
	//관리자 - 행정구역 정보 update (district 테이블)
	@Update("UPDATE district SET district_name=#{district_name},district_latitude=#{district_latitude},district_lonitude=#{district_lonitude} WHERE district_num=#{district_num}")
	public void updateDistrict(PolicyVO policyVO);
	
	//관리자 - 행정구역 정보 update (policy 테이블)
	@Update("UPDATE policy SET policy_url=#{policy_url} WHERE district_num=#{district_num}")
	public void updatePolicy(PolicyVO policyVO);
	
	//관리자 - 행정구역 정보 삭제 (policy 테이블)
	@Delete("DELETE FROM policy WHERE district_num=#{district_num}")
	public void deletePolicy(int distirct_num);
	
	//관리자 - 행정구역 정보 삭제 (district 테이블)
	@Delete("DELETE FROM district WHERE district_num=#{district_num}")
	public void deleteDistrict(int distirct_num);
	
	//행정구역 정보 select 갯수 (district 테이블, policy 테이블)
	@Select("Select COUNT(*) FROM Policy JOIN district USING (district_num)")
	public int selectPolicyCount();
	
	//행정구역 정보 select (district 테이블, policy 테이블)
	public List<PolicyVO> selectPolicyList(Map<String,Object> map);
	
	//개별 행정구역 정보 select
	@Select("Select * FROM Policy JOIN district USING (district_num) WHERE district_num=#{district_num}")
	public PolicyVO selectPolicy(int district_num);
	
}