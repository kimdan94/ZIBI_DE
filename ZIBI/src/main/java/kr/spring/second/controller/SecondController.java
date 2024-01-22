package kr.spring.second.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.vo.MemberVO;
import kr.spring.second.vo.SecondVO;
import kr.spring.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecondController {
	//자바빈(VO) 초기화
	@ModelAttribute
	public SecondVO initCommand() {
		return new SecondVO();
	}
	
	/*================================
	 * 중고거래 글 등록
	 *================================*/
	//등록 폼 호출
	@GetMapping("/secondhand/write")
	public String scwriteform() {
		return "secondWrite"; //타일스
	}
	
	//등록폼 전송된 데이터 처리 
	@PostMapping("/secondhand/write")
	public String scwritesubmit(@Valid SecondVO secondVO, BindingResult result,
						HttpServletRequest request , HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<중고거래 글 저장>> : " + secondVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return scwriteform();
		}
		
		//회원 번호 셋팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		secondVO.setMem_num(vo.getMem_num());
		//ip 셋팅
		secondVO.setSc_ip(request.getRemoteAddr());
		//파일 업로드
		secondVO.setSc_filename(FileUtil.createFile(request, secondVO.getUpload()));
		
		//글쓰기
		
		
		
		
		return "/common/resultAlert";
	}
	
	//중고거래 메인
	@RequestMapping("/secondhand/list")
	public String secondMain() {
		return "secondMain"; //타일스
	}
	
}








