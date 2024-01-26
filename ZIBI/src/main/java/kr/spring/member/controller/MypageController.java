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
		MemberVO memberVO = memberService.selectMember(user.getMem_num());
		return memberVO;
	}
	
	//마이페이지 메인
	@RequestMapping("/member/mypageMain")
	public String mypageMain(HttpSession session, Model model) {
		model.addAttribute("pageName","마이페이지");
		return "mypageMain"; //타일즈
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
	
	//비밀번호 변경 폼
	@GetMapping("/member/passwordUpdate")
	public ModelAndView updatePasswordForm() {
		return new ModelAndView("passwordUpdateForm","pageName","비밀번호 변경");
	}
	
	//비밀번호 변경 submit
	@PostMapping("/member/passwordUpdate")
	public String updatePassword(@Valid MemberVO memberVO,BindingResult result,HttpSession session,Model model) {
		
		model.addAttribute("pageName","비밀번호 변경");
		
		//공란 입력 시
		if(result.hasFieldErrors()) {
			result.reject("passwordBlank");
			return "passwordUpdateForm";
		}
		
		MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
		
		//현재와 똑같은 비밀번호 입력 시
		if(memberVO.getMem_password().equals(db_member.getMem_password())) {
			result.reject("passwordDuplicated");
			return "passwordUpdateForm";
		}
		
		model.addAttribute("pageName","마이페이지");
		memberService.updateMemberDetail(memberVO);
		
		return "mypageMain";
	}
	
}