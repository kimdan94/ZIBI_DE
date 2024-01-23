package kr.spring.helper.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class HelperVO {

	private int helper_num;
	private int helper_category;
	private int helper_select;//헬프미&헬프유 선택
	private int helper_hit;
	@NotBlank
	private String helper_title;
	@NotBlank
	private String helper_content;
	private MultipartFile upload;
	private String helper_filename;
	private String helper_zipcode;
	@NotBlank
	private String helper_address1;
	private String helper_address2;
	private String helper_ip;
	private int helper_solution;
	private Date helper_reg_date;
	private Date helper_modify_date;
	private int mem_num;
	
}
