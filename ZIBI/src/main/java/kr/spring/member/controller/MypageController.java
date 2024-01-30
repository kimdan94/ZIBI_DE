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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		return memberService.selectMember(user.getMem_num());
	}
	
	//마이페이지 메인
	@RequestMapping("/member/mypageMain")
	public String mypageMain() {
		return "mypageMain"; //타일즈
	}
	
	//마이페이지-거래내역
	@RequestMapping("/member/mypageDeal")
	public String mypageDeal() {
		return "mypageDeal"; //타일즈
	}
	
	//마이페이지-활동내역
	@RequestMapping("/member/mypageAct")
	public String mypageAct() {
		return "mypageAct"; //타일즈
	}
	
	//마이페이지-팔로우내역
	@RequestMapping("/member/mypageFollow")
	public String mypageFollow() {
		return "mypageFollow"; //타일즈
	}
	
	//회원 정보 수정폼
	@GetMapping("/member/mypageUpdate")
	public String mypageUpdateForm() {
		return "mypageUpdate";
	}
	
	//회원 정보 수정 submit
	@PostMapping("/member/mypageUpdate")
	public String mypageUpdateSubmit(@Valid MemberVO memberVO, BindingResult result,HttpSession session) {
		
		log.debug("<<회원 정보 수정 1>> : " + memberVO);
		
		if(result.hasErrors()) { //유효성 체크
			return"mypageUpdate";
		}
		
		memberService.updateMemberDetail(memberVO);//update 진행
		session.setAttribute("user",memberVO);
		
		return "redirect:/member/mypageMain";
	}
	
	//비밀번호 변경 폼
	@GetMapping("/member/passwordUpdate")
	public String updatePasswordForm() {
		return "passwordUpdateForm";
	}
	
	//비밀번호 변경 submit
	@PostMapping("/member/passwordUpdate")
	public String updatePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {
		
		//공란 입력 시
		if(result.hasFieldErrors("mem_password")) {
			result.reject("passwordBlank");
			return "passwordUpdateForm";
		}
		
		MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
		
		//현재와 똑같은 비밀번호 입력 시
		if(memberVO.getMem_password().equals(db_member.getMem_password())) {
			result.reject("passwordDuplicated");
			return "passwordUpdateForm";
		}
		
		memberService.updatePassword(memberVO);
				
		return "redirect:/member/mypageMain";
	}
	
	//회원 탈퇴 비밀번호 확인폼
	@RequestMapping("/member/checkPassword")
	public String passwordForm() {
		return "checkPassword";
	}
	
	//회원 탈퇴
	@RequestMapping("/member/quitMember")
	public String quitMember(HttpSession session, RedirectAttributes attr) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		log.debug("<<회원 탈퇴>> : " +  user );
		
		session.invalidate(); //로그아웃
		memberService.quitMember(user.getMem_num()); //탈퇴
		
		if(user.getMem_social()==2) attr.addFlashAttribute("message","quitNaver");
		else attr.addFlashAttribute("message","quit");
		
		return "redirect:/main/home";
	}
}