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
import kr.spring.performance.vo.TicketingVO;
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
	@RequestMapping("/performance/list")
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
		mav.setViewName("performanceList"); // tiles 설정 name과 동일해야 함
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
	@RequestMapping("/performance/write") // -> /performance/writePerformance로 변경하기
	public String form() {
		log.debug("<<영화 등록 폼>>");
		return "writePerformance"; // write.jsp명과 동일 tiles
	}
	
	//전송된 데이터 처리
	@PostMapping("/performance/register")
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
		model.addAttribute("url", request.getContextPath()+"/performance/performanceList");
		
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
	@RequestMapping("/performance/writeCinema")
	public String formCinema() {
		log.debug("<<상영관 등록 폼>>");
		return "writeCinema"; // write.jsp명과 동일 tiles
	}
	//전송된 데이터 처리
	@PostMapping("/performance/registerCinema")
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
		model.addAttribute("message", "상영관이 등록되었습니다");
		model.addAttribute("url", request.getContextPath()+"/performance/performanceList");
		
		return "common/resultAlert";
	}
	
	/*=================================
	 * 상영관 선택
	 *=================================*/
	// 상영관 선택 폼 호출
	@GetMapping("/performance/ticketing")
	public ModelAndView ticketPage(@RequestParam(value="performance_num", defaultValue="0") int performance_num) {
		// 그냥 예매하기 버튼으로 간건지
		// 영화를 클릭하고 예매하기 버튼으로 갔는지 구분하기
		log.debug("<<티켓 페이지>>");
		log.debug("<<선택한 영화 번호-performance_num>> : " + performance_num);
		log.debug("<<오늘 날짜>> : " + PerformanceController.getCurrentDateTime());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 상영관 리스트 출력
		List<CinemaVO> cinemaList = null;
		cinemaList = performanceService.selectCinemaLoc1();
		
		log.debug(""+cinemaList);
		
		// 전체/검색 레코드 수
		int count = performanceService.selectRowCount(map);
		log.debug("<<영화 개수>> : " + count);
		
		// 영화 리스트 출력
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
	
	
	/*=================================
	 * 영화관,상영관,상영 날짜,상영 시간 선택 폼
	 *=================================*/
	// 자바빈(VO) 초기화
	@ModelAttribute
	public TicketingVO initPerformanceDate() {
		return new TicketingVO();
	}
	@RequestMapping("/performance/writePerformanceDate")
	public ModelAndView formPerformanceDate() {
		log.debug("<<영화관,상영관,상영 날짜,상영 시간 선택 폼>>");
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 영화 select
		List<PerformanceVO> listPerformance = null;
		listPerformance = performanceService.selectList(map);
		
		// 상영관 지역1 select
		List<CinemaVO> listCinemaLoc1 = null;
		listCinemaLoc1 = performanceService.selectCinemaLoc1();
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("writePerformanceDate"); // tiles 설정
		mav.addObject("listPerformance", listPerformance);
		mav.addObject("listCinemaLoc1", listCinemaLoc1);

		return mav; 
	}
	//전송된 데이터 처리
	@PostMapping("/performance/registerDate")
	public String submitDate(@Valid TicketingVO  ticketingVO, BindingResult result, 
			             HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<상영 정보 저장>> : " + ticketingVO);
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		performanceService.insertDate(ticketingVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "날짜 정보가 등록되었습니다");
		model.addAttribute("url", request.getContextPath()+"/performance/performanceList");
		
		return "common/resultAlert";
	}
	
	
	

}
