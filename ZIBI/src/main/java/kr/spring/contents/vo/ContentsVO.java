package kr.spring.contents.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ContentsVO {
	private int contents_num;
	private int mem_num;
	@NotBlank
	private int contents_category;//0 : 요리, 1 : 청소, 2 : 부동산 계약, 3 : 진로, 4 : 기타
	@NotBlank
	private String contents_title;
	@NotBlank
	private String contents_essay;
	@NotBlank
	private String contents_fileName;
	private int contents_pay;//0 : 무료 발행(default), 1 : 유료 발행
	private String contents_account;
	@Size(min=100,max=99999)
	private int contents_price;
	private int contents_show;//0 : 발행 중(default), 1 : 글 삭제
	private Date contents_regDate;//SYSDATE(default)
	private Date contents_modifyDate;
	private String contents_ip;
	
	/*-- JOIN으로 읽어올 정보 --*/
	private String mem_nickname;
	
	private int fav_cnt;//좋아요 개수
	private int reply_cnt;//댓글 개수
}
