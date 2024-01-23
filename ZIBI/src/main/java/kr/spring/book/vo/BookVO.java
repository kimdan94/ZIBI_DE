package kr.spring.book.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	private int book_num;
	private int mem_num;
	private MultipartFile upload;
	@NotBlank
	private String book_thumbnailName;
	private String book_fileName;
	@NotNull
	private int book_category;//0 : 취미 소모임, 1: 원데이 클래스, 2 : 스터디 모임
	private int book_onoff;//0 : 모집 중(default), 1 : 모임 완료, 2 : 모임 취소
	@NotBlank
	private String book_title;
	@NotBlank
	private String book_content;
	@NotBlank
	private String book_gatheringDate;
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
	@Range(min=2,max=99)
	@NotNull
	private int book_maxcount;
	private int book_headcount;//0(default)
	private String book_ip;
	private int book_expense;//0(default)
	
	/*-- JOIN으로 읽어올 정보 --*/
	private String mem_nickname;
	
	private int matching_cnt;//예약 신청수
	private int rev_cnt;//예약 리뷰 개수
	private int scrap_cnt;//스크랩 개수
}
