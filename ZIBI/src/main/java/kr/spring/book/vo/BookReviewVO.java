package kr.spring.book.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookReviewVO {
	private int book_num;
	private int mem_num;
	@NotBlank
	private String book_rev;
	@Size(min=1,max=5)
	private int book_grade;
}
