package kr.spring.performance.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.performance.service.PerformanceService;
import kr.spring.performance.vo.PerformanceVO;
import kr.spring.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PerformanceController {
	// 의존성 주입
	@Autowired
	private PerformanceService performanceService;
	
	
	/*=================================
	 * 공연 리스트
	 *=================================*/
	@RequestMapping("/ent/list")
	public String mainList() {
		log.debug("<<여기>>");
		return "list";
	}
	
	
	/*=================================
	 * 게시판 글 등록
	 *=================================*/
	// 자바빈(VO) 초기화
	@ModelAttribute
	public PerformanceVO initCommand() {
		return new PerformanceVO();
	}
	
	// 등록 폼 호출
	@RequestMapping("/ent/write")
	public String form() {
		log.debug("<<영화 등록 폼>>");
		return "write"; // write.jsp명과 동일 tiles
	}
	
	//전송된 데이터 처리
	@PostMapping("/ent/register")
	public String submit(@Valid PerformanceVO performanceVO, BindingResult result, 
			             HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<영화 저장>>" + performanceVO);
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		// 파일 업로드
		performanceVO.setPerformance_poster(FileUtil.createFile(request, performanceVO.getUpload()));
		
		// sql - 영화 등록
		performanceService.insertPerformance(performanceVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "영화가 등록되었습니다");
		model.addAttribute("url", request.getContextPath()+"/ent/list");
		
		return "common/resultAlert";
	}
	

}
