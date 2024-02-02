package kr.spring.performance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.performance.service.PerformanceService;
import kr.spring.performance.vo.ChoiceVO;
import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;
import kr.spring.performance.vo.TicketingVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PerformanceAjaxController {
	// 의존성 주입
	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private MemberService memberService;
	
	/*=================================
	 * [관리자] 상영관 - 상영관 + 2관
	 *=================================*/
	@RequestMapping("/admin/adminSelectLocation")
	@ResponseBody
	public Map<String, Object> adminSelectLocation(@RequestParam(value="location1") String loc1, HttpSession session, HttpServletRequest request){
		Map<String, Object> mapJson = new HashMap<String, Object>();
		List<CinemaVO> listLoc2 = null;
		listLoc2 = performanceService.adminSelectLocation(loc1);
		mapJson.put("result", "success");
		
		mapJson.put("listLoc2", listLoc2);
		
		log.debug("<<admin loc1>> : " + loc1);
		log.debug("<<admin listLoc2>> : " + listLoc2);
		
		return mapJson;
	}
	
	/*=================================
	 * [사용자]
	 *=================================*/
	@RequestMapping("/performance/selectLocation")
	@ResponseBody
	public Map<String, Object> selectLocation(@RequestParam(value="location1") String loc1, HttpSession session, HttpServletRequest request){
		Map<String, Object> mapJson = new HashMap<String, Object>();
		List<CinemaVO> listLoc2 = null;
		listLoc2 = performanceService.selectLocation2(loc1);
		mapJson.put("result", "success");
		
		mapJson.put("listLoc2", listLoc2);
		
		log.debug("<<loc1>> : " + loc1);
		log.debug("<<listLoc2>> : " + listLoc2);
		
		return mapJson;
	}
	
	@RequestMapping("/performance/selectLocList")
	@ResponseBody
	public Map<String, Object> selectLocList(HttpSession session, HttpServletRequest request){
		Map<String, Object> mapJson = new HashMap<String, Object>();
		List<CinemaVO> listColor = null;
		listColor = performanceService.selectCinemaLoc1();
		mapJson.put("result", "success");
		mapJson.put("listColor", listColor);
		
		log.debug("<<listColor>> : " + listColor);
		
		return mapJson;
	}
	
	@RequestMapping("/performance/locationNum")
	@ResponseBody // 지역2 str으로 해당 상영관의 번호 알아내기
	public Map<String, Object> locationNum(@RequestParam(value="location2") String location2, HttpSession session, HttpServletRequest request){
		Map<String, Object> mapJson = new HashMap<String, Object>();
		List<CinemaVO> locNum = null;
		locNum = performanceService.selectCinemaNum(location2);
		mapJson.put("result", "success");
		mapJson.put("locNum", locNum);
		
		log.debug("<<locNum>> : " + locNum);
		
		return mapJson;
	}
	
	@RequestMapping("/performance/resultPerformance")
	@ResponseBody // 상영관 + 날짜로 영화 list와 예매할 수 있는 상영관 찾기
	public Map<String, Object> resultPerformance(@RequestParam(value="cinema") String cinema, 
			                              @RequestParam(value="day") String day, 
			                              @RequestParam(value="performance_num") String performance_num,
			                              HttpSession session, HttpServletRequest request){
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		log.debug("<<<<<<<<<<<<<<<<<<<<<<시작>>>>>>>>>>>>>>>>>>>>>>");

		mapJson.put("result", "success");
		List<CinemaVO> locationNum = null;
		locationNum = performanceService.selectCinemaNum(cinema); // cinema : 지역2 -> 지역 번호 찾기
		log.debug("<<지역번호 길이>> : "  + locationNum.size());
		log.debug("<<지역>> : " + cinema);
		
		log.debug("<<날짜 출력>> : " + day);
		log.debug("<<영화 번호 출력>> : " + performance_num);

		
		// sql에 전송할 Map - 상영관 번호,선택 날짜, 오늘 날짜, 현재 시각 + if 영화 정보
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("day", day);
		
		// 지역번호 여러 개
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0; i<locationNum.size(); i++) {
			log.debug("<<지역 번호 출력>> : "+ locationNum.get(i).getCinema_num());
			list.add(locationNum.get(i).getCinema_num());
		}
		if(list!=null) {
			log.debug("<<list 값>> : " + list);
			map.put("list", list);
		}

		// 영화가 있을 경우
		if(performance_num != "" || performance_num != null) { // 영화가 있을 때 // ""가 맞음 null은 정확성을 위해 명시
			map.put("performance_num",performance_num);
		}
		
		// 상영관
		List<CinemaVO> resultCinema = null;
		resultCinema = performanceService.selectCinemaWithTicketing(map);
		log.debug("<<resultCinema>> : " + resultCinema);
		
		// 영화
		List<PerformanceVO> resultPerformance = null;
		resultPerformance = performanceService.selectPerformanceWithTicketing(map);
		log.debug("<<resultPerformance>> : " + resultPerformance);
		
		// 상영관+영화+날짜
		List<TicketingVO> resultTicketing = null;
		resultTicketing = performanceService.selectWithTicketing(map);
		log.debug("<<resultTicketing>> : " + resultTicketing);
			
		log.debug("<<<<<<<<<<<<<<<<<<<<<<끝>>>>>>>>>>>>>>>>>>>>>>");
		
		mapJson.put("resultCinema", resultCinema);
		mapJson.put("resultPerformance", resultPerformance);
		mapJson.put("resultTicketing", resultTicketing);
		
		return mapJson;
		
	}
	
	
	/*=================================
	 * 좌석 선택 페이지 - 좌석 선택
	 *=================================*/
	@RequestMapping("/performance/drawSeat")
	@ResponseBody // 지역2 str으로 해당 상영관의 번호 알아내기
	public Map<String, Object> drawSeat(@RequestParam(value="ticketing_num",defaultValue="0") Integer ticketing_num, HttpSession session, HttpServletRequest request){
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		log.debug("<<Mem_num>> : " + user.getMem_num());
		log.debug("<<ticketing_num 값 알아내기>>: " + ticketing_num);
//		map.put("mem_num", user.getMem_num());
		map.put("ticketing_num", ticketing_num);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();

		List<CinemaVO> pickCinema = null;
		List<PerformanceVO> pickPerformance = null;
		List<TicketingVO> pickTicketing = null;
		List<ChoiceVO> choosenSeat = null;
		
		// sql
		pickCinema = performanceService.pickCinema(map);
		pickPerformance = performanceService.pickPerformance(map);
		pickTicketing = performanceService.pickTicketing(map);
		
		// 이미 예약된 좌석 선택
		choosenSeat = performanceService.selectChoice(map);
		
		log.debug("===================<<Ajax>>======================");
		log.debug("<<pickCinema>> : " + pickCinema);
		log.debug("<<pickPerformance>> : " + pickPerformance);
		log.debug("<<pickTicketing>> : " + pickTicketing);
		log.debug("<<choosenSeat>> : " + choosenSeat);
		log.debug("===================<<Ajax>>======================");
		
		// ajax
		mapJson.put("pickCinema", pickCinema);
		mapJson.put("pickPerformance", pickPerformance);
		mapJson.put("pickTicketing", pickTicketing);
		mapJson.put("choosenSeat", choosenSeat);
		return mapJson;
	}
	
	
	
}
