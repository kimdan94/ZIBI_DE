package kr.spring.second.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.second.vo.SecondVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecondController {
	//자바빈(VO) 초기화
	@ModelAttribute
	public SecondVO initCommand() {
		return new SecondVO();
	}
	
	/*================================
	 * 중고거래 글 등록
	 *================================*/
	//등록 폼 호출
	@GetMapping("/secondhand/write")
	public String scwriteform() {
		return "secondWrite"; //타일스
	}
	
	
	
	
	//중고거래 메인
	@RequestMapping("/secondhand/list")
	public String secondMain() {
		return "secondMain"; //타일스
	}
	
}
