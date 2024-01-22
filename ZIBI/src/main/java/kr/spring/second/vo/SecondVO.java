package kr.spring.second.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SecondVO {
	private int sc_num; 		//판매글 등록 번호
	private String sc_title;	//글 제목
	private String sc_content; 	//글 내용
	private Integer sc_category; 	//상품 카테고리
	private int sc_price; 		//판매 가격
	private int sc_status;		//상품 상태 (1:중고, 2: 새상품)
	private int sc_way; 		//거래 방법(1: 직거래, 2: 택배)
	private String sc_place; 	//거래 희망 장소
	private double sc_latitude;	//위도
	private double sc_longitude;//경도
	private int sc_hit;			//판매글 조회수(default 0)
	private Date sc_reg_date;	//등록일(default sysdate)
	private Date sc_modify_date;//수정일
	private String sc_filename;	//업로드한 파일 이름
	private String sc_ip;		//글작성 ip
	private int sc_show;		//게시글 표시 여부(default 2: 표시, 1:미표시(숨김 처리))
	private int mem_num;		//회원번호
	
	private String mem_email;   //회원 ID
	private String mem_nickname;//사이트 내 활동명(닉네임)
	
	//DB에 없음
	private int sc_favcnt;      //판매글 관심수(찜)
}
