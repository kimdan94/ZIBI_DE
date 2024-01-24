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
		
		return mapJson;
	}
		
}
