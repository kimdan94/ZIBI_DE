package kr.spring.main.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LastestContentVO {
	
	private int num;
	private int mem_num;
	private String category;
	private String title;
	private String photo;
	private String mem_nickname;
	private Date reg_date;
	
}
