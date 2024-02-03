package kr.spring.policy.vo;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PolicyVO {
	
	private int district_num;
	@NotBlank
	private String district_name;
	@NotBlank
	private String district_latitude;
	@NotBlank
	private String district_lonitude;
	
	private String policy_url;
}
