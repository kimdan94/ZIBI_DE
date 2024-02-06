package kr.spring.second.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SecondReviewVO {
	private int sc_rev_num;		//후기번호 pk
	private double sc_rev_star;	//매너 평가 별점
	private String sc_rev_content;// 거래 후기 내용
	private int sc_num;			//판매글 등록 번호 fk
	private int reviewer_num;	//후기 작성한 사람  fk
	
	/* 읽어올 정보 */
	private String mem_nickname;
}
