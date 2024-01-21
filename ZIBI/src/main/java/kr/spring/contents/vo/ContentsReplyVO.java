package kr.spring.contents.vo;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ContentsReplyVO {
	private int contents_reNum;
	@NotBlank
	private String contents_comment;
	private String contents_reIp;
	private int contents_num;
	private int mem_num;
	
	/*-- JOIN으로 읽어올 정보 --*/
	private String mem_nickname;
}
