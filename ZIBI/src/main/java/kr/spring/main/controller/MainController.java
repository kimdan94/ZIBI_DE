package kr.spring.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.main.service.MainService;
import kr.spring.main.vo.LastestContentVO;
import kr.spring.performance.vo.PerformanceVO;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	/* ---------- 루트 경로 진입 ----------*/
	@RequestMapping("/")
	public String init(HttpSession session) {
		return "redirect:/main/home";
	}
	
	/* ---------- 메인 ----------*/
	@RequestMapping("/main/home")
	public String main(Model model) {
		
		//게시판 전체 최신글
		int count = mainService.selectLastestContentCount();
		List<LastestContentVO> list = null;
		
		if(count>0) {
			list = mainService.selectLastestContent();
		}
		
		//최신 영화
		PerformanceVO perf = mainService.selectLastestPerformance();
		
		model.addAttribute("list",list);
		model.addAttribute("count", count);
		model.addAttribute("perf",perf);
		
		return "home"; //타일스 설정명
	}
	
	/* ---------- 템플릿 샘플 ----------*/
	@RequestMapping("/sample")
	public String sample() {
		return "sample";
	}
}