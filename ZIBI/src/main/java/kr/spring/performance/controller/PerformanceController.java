package kr.spring.performance.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import kr.spring.performance.service.PerformanceService;
import kr.spring.performance.vo.CinemaVO;
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
	public ModelAndView mainList(@RequestParam(value="category", defaultValue="1") int category,
			                     String keyword) {
		log.debug("<<목록 메서드>>");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("category", category);
		
		// 전체/검색 레코드 수
		int count = performanceService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		log.debug("<<category>> : " + category);
		List<PerformanceVO> list = null;
		if(count > 0) {
			list = performanceService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list"); // tiles 설정
		mav.addObject("count", count);
		mav.addObject("list", list);

		return mav; 
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
	
	
	
	/*=================================
	 * 상영관 정보 등록
	 *=================================*/
	// 자바빈(VO) 초기화
	@ModelAttribute
	public CinemaVO initCinema() {
		return new CinemaVO();
	}
	// 상영관 등록 폼 호출
	@RequestMapping("/ent/writeCinema")
	public String formCinema() {
		log.debug("<<상영관 등록 폼>>");
		return "writeCinema"; // write.jsp명과 동일 tiles
	}
	//전송된 데이터 처리
	@PostMapping("/ent/registerCinema")
	public String submitCinema(@Valid CinemaVO CinemaVO, BindingResult result, 
			             HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<상영관 저장>>" + CinemaVO);
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		// sql - 상영관 등록
		performanceService.insertCinema(CinemaVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "영화가 등록되었습니다");
		model.addAttribute("url", request.getContextPath()+"/ent/list");
		
		return "common/resultAlert";
	}
	
	/*=================================
	 * 상영관 선택
	 *=================================*/
	// 상영관 선택 폼 호출
	@GetMapping("/ent/ticketing")
	public ModelAndView ticketPage(@RequestParam int performance_num) {
		
		log.debug("<<티켓 페이지>>");
		log.debug("<<영화 번호-performance_num>> : " + performance_num);
		log.debug("<<오늘 날짜>> : " + PerformanceController.getCurrentDateTime());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CinemaVO> cinemaList = null;
		cinemaList = performanceService.selectCinemaLoc1();
		
		log.debug(""+cinemaList);
		
		// 전체/검색 레코드 수
		int count = performanceService.selectRowCount(map);
		log.debug("<<영화 개수>> : " + count);
		List<PerformanceVO> list = null;
		if(count > 0) {
			list = performanceService.selectList(map);
		}
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ticketing"); // tiles 설정
		mav.addObject("cinemaList", cinemaList);
		mav.addObject("list", list);
		
		return mav; 
	}
	
	
	// 오늘 날짜, 현재 시간
	public static String getCurrentDateTime() {
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyy:MM:dd:HH:mm:ss"; // 년 월 일 시 분 초
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
		return formatter.format(today);
	}
	
	
	
	
	
	
	

}