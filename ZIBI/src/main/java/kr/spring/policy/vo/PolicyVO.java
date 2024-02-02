package kr.spring.policy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PolicyVO {
	
	private int district_num;
	private String district_name;
	private String district_latitude;
	private String district_lonitude;
	
	private String policy_url;
	
}
