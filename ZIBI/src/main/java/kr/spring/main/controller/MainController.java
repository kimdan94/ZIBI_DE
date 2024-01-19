package kr.spring.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	@RequestMapping("/")
	public String init(HttpSession session) {
		log.debug("<<루트 호출>");
		return "redirect:/main/home";
	}
	
	@RequestMapping("/main/home")
	public String main() {
		log.debug("<<헤더 호출>");
		return "home";
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "sample";//샘플페이지
	}
}






