package kr.spring.book.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	private int book_num;
	private int mem_num;
	@NotBlank
	private String book_thumbnailName;
	private String book_fileName;
	@NotBlank
	private int book_category;//0 : 취미 소모임, 1: 원데이 클래스, 2 : 스터디 모임
	private int book_onoff;//0 : 모집 중, 1 : 모임 완료, 2 : 모임 취소(default)
	@NotBlank
	private String book_title;
	@NotBlank
	private String book_content;
	@NotBlank
	private Date book_gatheringDate;
	private int book_match;//0 : 예약 바로 확정(default), 1 : 주최자 승인 필요
	private Date book_regDate;//SYSDATE(default)
	private Date modifyDate;
	@NotBlank
	private String book_address1;
	@NotEmpty
	private String book_address2;
	@Size(min=5,max=5)
	private String book_zipcode;
	private String book_kit;//준비물 없음(default)
	@Size(min=2,max=99)
	private int book_maxcount;
	@Size(min=0,max=99)
	private int book_headcount;//0(default)
	private String book_ip;
	@Size(min=0,max=999999)
	private int book_expense;//0(default)
	
	/*-- JOIN으로 읽어올 정보 --*/
	private String mem_nickname;
	
	private int matching_cnt;//예약 신청수
	private int rev_cnt;//예약 리뷰 개수
	private int scrap_cnt;//스크랩 개수
}
