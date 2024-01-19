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
		return "redirect:/main/home";
	}
	
	@RequestMapping("/main/home")
	public String main() {
		return "home";
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "sample";//샘플페이지
	}
}






