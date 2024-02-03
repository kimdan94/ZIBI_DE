package kr.spring.policy.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import kr.spring.policy.vo.PolicyVO;

public interface PolicyService {
	
	//관리자 - 행정구역 primary key
	public int selectDistrictNumber();
	
	//관리자 - 행정구역 정보 insert (district 테이블, policy 테이블)
	public void insertDistrict(PolicyVO policyVO);
	
	//관리자 - 정책 url update
	public void insertPolicy(PolicyVO policyVO);
	
	//행정구역 정보 select 갯수 (district 테이블, policy 테이블)
	public int selectPolicyCount();
	
	//행정구역 정보 select (district 테이블, policy 테이블)
	public List<PolicyVO> selectPolicyList(Map<String,Object> map);
	
	//개별 행정구역 정보 select
	public PolicyVO selectPolicy(int district_num);
	
	//관리자 - 행정구역 정보 update (district 테이블)
	public void updateDistrict(PolicyVO policyVO);
	
	//관리자 - 행정구역 정보 update (policy 테이블)
	public void updatePolicy(PolicyVO policyVO);
	
	//관리자 - 행정구역 정보 삭제 (policy 테이블)
	public void deletePolicy(int distirct_num);
	
	//관리자 - 행정구역 정보 삭제 (district 테이블)
	public void deleteDistrict(int distirct_num);

}
