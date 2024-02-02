package kr.spring.checklist.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CheckListVO {
	private int check_id;
	@NotBlank
	private String room_name;
	@NotBlank
	private String room_address1;
	private String room_address2;
	@NotBlank
	private int room_deposit;
	private int room_expense;
	private int room_size;
	private int room_star;
	private String room_description;
	private MultipartFile upload;
	private String room_filname;
	
	private int room_check1;
	private int room_check2;
	private int room_check3;
	private int room_check4;
	private int room_check5;
	private int room_check6;
}
