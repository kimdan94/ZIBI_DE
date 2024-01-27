package kr.spring.performance.controller;

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

import kr.spring.performance.service.PerformanceService;
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
	
	@RequestMapping("/performance/selectLocation")
	@ResponseBody
	public Map<String, Object> processFile(@RequestParam(value="location1") String loc1, HttpSession session, HttpServletRequest request){
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
			                              @RequestParam(value="performance") String performance,
			                              @RequestParam(value="now") String now, // 현재 날짜+시간
			                              HttpSession session, HttpServletRequest request){
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		
		log.debug("<<<<<<<<<<<<<<<<<<<<<<시작>>>>>>>>>>>>>>>>>>>>>>");
		mapJson.put("result", "success");
		List<CinemaVO> locationNum = null;
		locationNum = performanceService.selectCinemaNum(cinema); // cinema : 지역2 -> 
		int cinema_num = locationNum.get(0).getCinema_num();

		log.debug("<<지역 번호 출력>> : "+ cinema_num);
		log.debug("<<날짜 출력>> : " + day);
		String today_date = now.substring(0,10);
		String today_time = now.substring(11,16);
		
		// sql에 전송할 Map - 상영관 번호,선택 날짜, 오늘 날짜, 현재 시각 + if 영화 정보
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cinema_num", cinema_num);
		map.put("day", day);
		map.put("today_date", today_date);
		map.put("today_time", today_time);
		
		
		List<CinemaVO> resultCinema = null;
		List<PerformanceVO> resultPerformance = null;
		List<TicketingVO> resultTicketing = null;
		
		log.debug("<<영화 출력>> : " + performance);
		if(performance != "" || performance != null) { // 영화가 있을 때 // ""가 맞음 null은 정확성을 위해 명시
			map.put("performance",performance);
		}
		resultCinema = performanceService.selectCinemaWithTicketing(map);
		log.debug("<<resultCinema>> : " + resultCinema);
		
		resultPerformance = performanceService.selectPerformanceWithTicketing(map);
		log.debug("<<resultPerformance>> : " + resultPerformance);
		
		resultTicketing = performanceService.selectWithTicketing(map);
		log.debug("<<resultTicketing>> : " + resultTicketing);
			
		log.debug("<<<<<<<<<<<<<<<<<<<<<<끝>>>>>>>>>>>>>>>>>>>>>>");
		
		
		
		mapJson.put("resultCinema", resultCinema);
		mapJson.put("resultPerformance", resultPerformance);
		mapJson.put("resultTicketing", resultTicketing);
		
		return mapJson;
	}
	
	@RequestMapping("/performance/resultPerformanceWithEnt")////////////////////////////
	@ResponseBody // 상영관 + 날짜로 영화 list와 예매할 수 있는 상영관 찾기
	public Map<String, Object> resultPerformanceWithEnt(@RequestParam(value="cinema") String cinema, 
			                              @RequestParam(value="day") String day, 
			                              @RequestParam(value="performance") String performance,
			                              HttpSession session, HttpServletRequest request){
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		mapJson.put("result", "success");
		log.debug("<<performance 찍어보기>> : " + performance);
		
		List<CinemaVO> locationNum = null;
		locationNum = performanceService.selectCinemaNum(cinema);
		int cinema_num = locationNum.get(0).getCinema_num();
		log.debug("지역 번호 출력 : "+cinema_num);
		log.debug("날짜 출력 : " + day);
		
		
		List<CinemaVO> resultCinema = null;
//		resultCinema = performanceService.selectCinemaWithTicketing(cinema_num, day);
		log.debug("<<resultCinema>> : " + resultCinema);
		
		
		List<PerformanceVO> resultPerformance = null;
//		resultPerformance = performanceService.selectPerformanceWithTicketing(cinema_num, day);
		log.debug("<<resultPerformance>> : " + resultPerformance);
		
		
		List<TicketingVO> resultTicketing = null;
//		resultTicketing = performanceService.selectWithTicketing(cinema_num, day);
		log.debug("<<resultTicketing>> : " + resultTicketing);

		
		mapJson.put("resultCinema", resultCinema);
		mapJson.put("resultPerformance", resultPerformance);
		mapJson.put("resultTicketing", resultTicketing);
		
		return mapJson;
	}
	
	
	
	
	
}
