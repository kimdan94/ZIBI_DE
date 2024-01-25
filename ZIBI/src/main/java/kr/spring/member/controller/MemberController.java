package kr.spring.member.controller;


import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PasswordCheckException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	//의존 관계 주입
	@Autowired
	private MemberService memberService;
	
	//VO 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//회원가입 폼 호출
	@GetMapping("/member/register")
	public ModelAndView memberRegister(Model model) {
		return new ModelAndView("registerForm","pageName","회원가입"); //타일즈
	}
	
	//회원가입 처리
	@PostMapping("/member/register")
	public String registerSubmit(@Valid MemberVO memberVO, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("mem_email") || result.hasFieldErrors("mem_password")) {//유효성 체크
			model.addAttribute("pageName","회원 가입");
			return "registerForm";
		}
		memberVO.setMem_num(memberService.createMemNum());
		memberService.registerMember(memberVO);//회원가입
		return "home"; //타일즈
	}
	
	
	//로그인 폼 호출
	@GetMapping("/member/login")
	public ModelAndView loginForm() {
		return new ModelAndView("loginForm","pageName","로그인"); //타일즈
	}
	
	//로그인 처리
	@RequestMapping("/member/login")
	public String loginSubmit(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {
		
		log.debug("<<로그인>>" + memberVO);
		
		//로그인 체크
		MemberVO db_member = null;
		
		try {
			db_member = memberService.checkEmail(memberVO.getMem_email());
			boolean check = false;
			log.debug("<<로그인 check>>" + db_member);
			
			if( db_member != null ) //아이디 존재할 경우
				check = db_member.checkPassword(memberVO.getMem_password()); //비밀번호 일치여부 확인
			
			if(check) { //비밀번호 일치할 경우
				
				/*자동 로그인 처리 필요*/
				
				session.setAttribute("user",db_member); //로그인 처리
				return "redirect:/main/home";
			}
			
			throw new PasswordCheckException(); //비밀번호 미일치할 경우 예외 던지기
			
		} catch (PasswordCheckException e) {
			result.reject("invalidIdOrPassword");
			model.addAttribute("pageName","로그인");
			return "loginForm";
		}
	}

	//로그아웃 처리
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/home";
	}
	
	/*-----프로필 사진-----*/
	//로그인 전용 프로필 사진 출력 (마이페이지 사용)
	@RequestMapping("/member/photoView")
	public String photoView(Model model, HttpServletRequest request, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인 정보
		
		if(user==null) { //미로그인 시
			getBasicProfileImage(request, model);
		} else { //로그인 시
			MemberVO memberVO = memberService.selectMember(user.getMem_num());
			viewProfile(memberVO, request, model);
		}
		
		return "imageView"; //view 클래스로
	}
	
	//회원번호 지정 프로필 사진 출력 (게시판 사용)
	@RequestMapping("/member/viewProfile")
	public String getProfileByMem_num(@RequestParam int mem_num, HttpServletRequest request, Model model) {
		
		MemberVO memberVO = memberService.selectMember(mem_num);
		viewProfile(memberVO, request, model);
		
		return "imageView";
	}
	
	//프로필 사진 처리
	public void viewProfile(MemberVO memberVO, HttpServletRequest request, Model model) {
		if(memberVO==null||memberVO.getMem_photoname()==null) {
			getBasicProfileImage(request, model);
		} else {
			model.addAttribute("imageFile",memberVO.getMem_photo());
			model.addAttribute("filename",memberVO.getMem_photoname());
		}
	}
	
	//기본 프로필 사진 처리
	public void getBasicProfileImage(HttpServletRequest request, Model model) {
		byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
		model.addAttribute("imageFile",readbyte);
		model.addAttribute("filename","face.png");
	}
}