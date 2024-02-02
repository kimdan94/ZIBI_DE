package kr.spring.performance.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@Autowired
	private MemberService memberService;
	
	/*=================================
	 * 기본 레이아웃 (타일즈 설정을 위한 페이지)
	 *=================================*/
	@RequestMapping("/performance/layout")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("performancePage"); //타일스
		return mav; //타일스 설정명
	}
	
	
	/*=================================
	 * [메인] 공연 리스트
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
		model.addAttribute("url", request.getContextPath()+"/performance/list");
		
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
		model.addAttribute("url", request.getContextPath()+"/performance/list");
		
		return "common/resultAlert";
	}
	
	/*=================================
	 * 상영관 선택
	 *=================================*/
	// 상영관+영화+날짜 중 영화 출력 페이지 호출
	@GetMapping("/performance/ticketing")
	public ModelAndView ticketPage(@RequestParam(value="performance_num", defaultValue="0") int performance_num) {
		// 그냥 예매하기 버튼으로 간건지
		// 영화를 클릭하고 예매하기 버튼으로 갔는지 구분하기
		log.debug("<<티켓 페이지>>");
		log.debug("<<선택한 영화 번호-performance_num>> : " + performance_num);
		log.debug("<<오늘 날짜>> : "); // 2024:01:25:17:38:33
		
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
		
		// 날짜
		List<TicketingVO> dayList = null;
		dayList = performanceService.selectDate();
		log.debug("<<날짜 출력>> : " + dayList);
		String time = PerformanceController.getCurrentDateTime();
		String today = time.substring(0,10); // YYYY:MM:DD:hh:mm // 시간 24시 기준
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ticketing"); // tiles 설정
		
		mav.addObject("cinemaList", cinemaList); // 상영관
		
		mav.addObject("list", list); // 영화
		
		// 날짜
		mav.addObject("dayList", dayList);
		mav.addObject("today", today);
		
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
		model.addAttribute("url", request.getContextPath()+"/performance/list");
		
		return "common/resultAlert";
	}
	
	/*=================================
	 * 좌석 선택
	 *=================================*/
	// 좌석 선택 페이지
	// [상영관+영화+날짜] 선택 (폼) 페이지 제출 시 -> performanceSeat 페이지로 전송하려면 아래 method와 @RequestMapping이 동시에 있어야 함
	// [상영관+영화+날짜] 선택 (폼) : 전송된 데이터 처리
	@RequestMapping("/performance/updateTicketing")
	public ModelAndView submitDate(@RequestParam(value="ticketing_num",defaultValue="0") Integer ticketing_num,
			HttpServletRequest request, HttpSession session) {
		log.debug("<<좌석 선택>>");
		log.debug("<<ticketing_num>> : " + ticketing_num); // 명량 104
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		
		log.debug("<<mem_num>> : " + memberVO.getMem_num());
		log.debug("<<mem_num>> : " + memberVO.getMem_email());
		log.debug("<<mem_num>> : " + memberVO.getMem_nickname());
		
		
		map.put("ticketing_num", ticketing_num);
		
		List<CinemaVO> pickCinema = null;
		List<PerformanceVO> pickPerformance = null;
		List<TicketingVO> pickTicketing = null;
		
		pickCinema = performanceService.pickCinema(map);
		pickPerformance = performanceService.pickPerformance(map);
		pickTicketing = performanceService.pickTicketing(map);
		
		TicketingVO tmpTicket = performanceService.choosingTicketing(map);
		log.debug("================================================");
		log.debug("<<pickCinema>> : " + pickCinema);
		log.debug("<<pickPerformance>> : " + pickPerformance);
		log.debug("<<pickTicketing>> : " + pickTicketing);
		log.debug("================================================");
		
		mav.setViewName("performanceSeat"); // tiles 설정 name과 동일해야 함
		mav.addObject("pickCinema", pickCinema);
		mav.addObject("pickPerformance", pickPerformance);
		mav.addObject("pickTicketing", pickTicketing);
		mav.addObject("tmpTicket", tmpTicket);
		
		return mav; 
	}
	
	
	
	// 결제창으로 이동
	@PostMapping("/performance/submitSeat")
	public ModelAndView submitSeat() {
		log.debug("<<결제창으로 이동>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("performancePayment"); // tiles 설정 name과 동일해야 함

		return mav; 
	}
	
	
	
	
	
	

}
