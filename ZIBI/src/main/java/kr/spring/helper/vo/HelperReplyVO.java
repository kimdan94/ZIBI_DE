package kr.spring.helper.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class HelperReplyVO {
	private int re_num;
	private String re_content;
	private Date re_date;
	private Date re_mdate;
	private String re_ip;
	private int helper_num;
	private int mem_num;
	
	private String mem_nickname;
}
