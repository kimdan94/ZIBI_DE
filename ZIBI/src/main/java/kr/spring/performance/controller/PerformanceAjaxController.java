package kr.spring.performance.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.performance.service.PerformanceService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PerformanceAjaxController {
	// 의존성 주입
	@Autowired
	private PerformanceService performanceService;
	
		
}
