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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
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
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
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
	
	/*-----프로필 사진-----*/
	//로그인 전용 프로필 사진 출력 (마이페이지 사용)
	@RequestMapping("/member/photoView")
	public String photoView(Model model, HttpServletRequest request, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인 정보
		
		log.debug("<<로그인 전용>>");
		
		if(user==null) { //미로그인 시
			getBasicProfileImage(request, model);
		} else { //로그인 시
			MemberVO memberVO = memberService.selectMember(user.getMem_num());
			viewProfile(memberVO, request, model);
		}
		
		return "imageView"; //view 클래스로
	}
	
	//회원번호 지정 프로필 사진 출력 (게시판 사용)
	
	
	//프로필 사진 처리
	public void viewProfile(MemberVO memberVO, HttpServletRequest request, Model model) {
		log.debug("<<프사 처리>>");
		if(memberVO==null||memberVO.getMem_photoname()==null) {
			getBasicProfileImage(request, model);
		} else {
			model.addAttribute("imageFile",memberVO.getMem_photo());
			model.addAttribute("filename",memberVO.getMem_photoname());
		}
	}
	
	//기본 프로필 사진 처리
	public void getBasicProfileImage(HttpServletRequest request, Model model) {
		log.debug("<<기본 프사>>");
		byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
		model.addAttribute("imageFile",readbyte);
		model.addAttribute("filename","face.png");
	}
	
}
