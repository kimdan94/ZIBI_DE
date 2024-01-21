package kr.spring.book.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookMatchingVO {
	private int book_num;
	private int mem_num;
	@NotBlank
	private int book_state;//0 : 대기, 1 : 확정, 2 : 거절, 3 : 취소
	private Date book_matchDate;//SYSDATE(default)
}
