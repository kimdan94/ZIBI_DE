package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.book.vo.BookMatchingVO;
import kr.spring.book.vo.BookVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.ActListVO;
import kr.spring.member.vo.DealListVO;
import kr.spring.member.vo.FollowListVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.second.vo.SecondVO;
import kr.spring.util.PageUtil_na;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	/*---------------------의존 관계 주입-----------------------*/
	@Autowired
	private MemberService memberService;
	
	//카카오 앱키 호출
	@Value("${NA-API-KEY.kakaoAppKey}")
	private String kakao_apikey;
	
	//VO 초기화
	@ModelAttribute
	public MemberVO initCommand(HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		return memberService.selectMember(user.getMem_num());
	}
	
	//메인
	@RequestMapping("/member/mypageMain")
	public String mypageMain(Model model) {
		
		model.addAttribute("apikey",kakao_apikey);
		
		return "mypageMain"; //타일즈
	}
	
	/*---------------------페이지 호출-----------------------*/
	//거래내역 목록
	@RequestMapping("/member/mypageDeal")
	public String mypageDeal(@RequestParam(value="pageNum",defaultValue="1") int currentPage, @RequestParam(value="category",defaultValue="1") String category, HttpSession session, Model model) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		map.put("category", category);
		map.put("mem_num", user.getMem_num());
		
		log.debug("<<카운트 읽어오기 시작>>");
		int count = memberService.selectDealCount(map);
		
		PageUtil_na page = new PageUtil_na(category, null, currentPage, count, 10, 10,"mypageDeal");
		
		List<DealListVO> list = null;
		
		if(count>0) {
			map.put("category", category);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			list = memberService.selectDealList(map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("page",page.getPage());
		
		return "mypageDeal"; //타일즈
	}
	
	//활동내역 목록
	@RequestMapping("/member/mypageAct")
	public String mypageAct(@RequestParam(value="pageNum",defaultValue="1") int currentPage, @RequestParam(value="category",defaultValue="1") String category, HttpSession session, Model model) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		map.put("category", category);
		map.put("mem_num", user.getMem_num());
		
		log.debug("<<카운트 읽어오기 시작>> : " + map);
		int count = memberService.selectActCount(map);
		
		PageUtil_na page = new PageUtil_na(category, null, currentPage, count, 10,10,"mypageAct");
		
		List<ActListVO> list = null;
		
		if(count>0) {
			map.put("category", category);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			list = memberService.selectActList(map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("page",page.getPage());
		
		return "mypageAct"; //타일즈
	}
	
	//팔로우내역 목록
	@RequestMapping("/member/mypageFollow")
	public String mypageFollow(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		int count = memberService.selectFollowCount(user.getMem_num());
		
		PageUtil_na page = new PageUtil_na(null,null, currentPage, count, 10,10,"mypageFollow"); //총 글 갯수?

		List<FollowListVO> list = null;
		Map<String,Integer> map = new HashMap<String, Integer>();
		
		if(count>0) {
			
			map.put("fmem_num", user.getMem_num());
			map.put("start",page.getStartRow());
			map.put("end",page.getEndRow());
			
			list = memberService.selectFollowList(map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("page",page.getPage());
		
		return "mypageFollow"; //타일즈
	}
	
	/*---------------------회원 정보 수정-----------------------*/
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
	
	/*---------------------비밀번호 변경-----------------------*/
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
	
	/*---------------------회원 탈퇴-----------------------*/
	//회원 탈퇴 비밀번호 확인폼
	@RequestMapping("/member/checkPassword")
	public String passwordForm() {
		return "checkPassword";
	}
	
	//회원 탈퇴
	@RequestMapping("/member/quitMember")
	public String quitMember(@Valid MemberVO memberVO, BindingResult result, HttpSession session, RedirectAttributes attr) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//소모임 조건 체크
		List<BookVO> list = memberService.selectBookList(user.getMem_num());
		
		for(int i=0 ; i<list.size() ; i++ ) {
			BookVO db_book = list.get(i);
			if(db_book.getCompareNow()==2) {
				result.reject("bookError");
				return "checkPassword";
			}
		}
		
		List<BookMatchingVO> mList = memberService.selectBookMatchingList(user.getMem_num());
		
		if(mList.size()>0) {
			result.reject("bookError");
			return "checkPassword";
		}
		
		//중고 거래 조건 체크
		SecondVO db_second = memberService.selectSecond(user.getMem_num());
		if(db_second != null) {
			result.reject("secondError");
			return "checkPassword";
		}
		
		session.invalidate(); //로그아웃
		//memberService.quitMember(user.getMem_num()); //탈퇴
		
		if(user.getMem_social()==2) attr.addFlashAttribute("message","quitNaver");
		else attr.addFlashAttribute("message","quit");
		
		return "redirect:/main/home";
	}
}