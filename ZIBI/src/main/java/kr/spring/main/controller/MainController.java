package kr.spring.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String init(HttpSession session) {
		return "redirect:/main/home";
	}
	
	@RequestMapping("/main/home")
	public String main() {

		return "home"; //타일스 설정명
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "sample";//샘플페이지
	}
}