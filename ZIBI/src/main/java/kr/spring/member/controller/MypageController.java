package kr.spring.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	//의존 관계 주입
	@Autowired
	private MemberService memberService;
	
	//VO 초기화
	@ModelAttribute
	public MemberVO initCommand(HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		return user;
	}
	
	//마이페이지 메인
	@RequestMapping("/member/mypageMain")
	public ModelAndView mypageMain() {
		return new ModelAndView("mypageMain","pageName","마이페이지"); //타일즈
	}
	
	//회원 정보 수정폼
	@GetMapping("/member/mypageUpdate")
	public ModelAndView mypageUpdateForm() {
		return new ModelAndView("mypageUpdate","pageName","회원 정보 수정");
	}
	
	//회원 정보 수정 submit
	@PostMapping("/member/mypageUpdate")
	public ModelAndView mypageUpdateSubmit(@Valid MemberVO memberVO, BindingResult result, Model model) {
		
		if(result.hasErrors()) { //유효성 체크
			return new ModelAndView("mypageUpdate","pageName","회원 정보 수정");
		} 
		
		log.debug("<<회원 정보 수정>> : " + memberVO);
		memberService.updateMemberDetail(memberVO);//update 진행
		
		return new ModelAndView("mypageMain","pageName","마이페이지");
	}
}
