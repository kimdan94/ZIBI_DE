package kr.spring.helper.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.helper.service.HelperService;
import kr.spring.helper.vo.HelperScrapVO;
import kr.spring.helper.vo.HelperVO;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HelperAjaxController {
	@Autowired HelperService helperService;
	
	/* 부모글 스크랩 읽기 */
	@RequestMapping("/helper/getScrap")
	@ResponseBody
	public Map<String, Object> getScrap(HelperScrapVO scrap, HttpSession session){
		log.debug("<재능기부 스크랩> : " + scrap);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noScrap");
		}else {
			//로그인된 회원번호 셋팅
			scrap.setMem_num(user.getMem_num());
			
			HelperScrapVO helperScrap = helperService.selectscrap(scrap);
			//스크랩 표시
			if(helperScrap!=null) {
				mapJson.put("status", "yesScrap");
			}else {
				mapJson.put("status", "noScrap");
			}
		}
		//스크랩수
		mapJson.put("count", helperService.selectScrapCount(scrap.getHelper_num()));
		
		return mapJson;
	}
	
	/* 부모글 스크랩 등록&삭제 */
	@RequestMapping("/helper/writeScrap")
	@ResponseBody
	public Map<String, Object> writeScrap(HelperScrapVO scrap, HttpSession session){
		log.debug("<부모글 스크랩 등록&삭제> : " + scrap);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		//로그인 여부 확인 
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인 된 회원번호 셋팅
			scrap.setMem_num(user.getMem_num());
			
			//이전에 스크랩 등록했는지 여부
			HelperScrapVO helperScrapVO = helperService.selectscrap(scrap);
			if(helperScrapVO!=null) {
				helperService.deleteScrap(scrap);//스크랩 삭제
				mapJson.put("status", "noScrap");
			}else {//스크랩 미등록
				helperService.insertScrap(scrap);
				mapJson.put("status", "yesScrap");
			}
			mapJson.put("result", "success");
			mapJson.put("count", helperService.selectScrapCount(scrap.getHelper_num()));
		}
		return mapJson;
	}
	
	/*------------------해결중&해결완료 토글-------------------*/
	
	/* 해결중&해결완료 읽기*/
	@RequestMapping("/helper/getSol")
	@ResponseBody
	public Map<String, Object> getSolution(HelperVO solution,HttpSession session){
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			mapJson.put("status", "noSol");
		}else {
			//로그인된 회원번호 셋팅
			solution.setMem_num(user.getMem_num());
			
			//해결여부 읽어오기
			HelperVO helpersol = helperService.selectSolution(solution);
			//해결여부 표시
			if(helpersol!=null) {
				mapJson.put("status", "noSol");
			}else {
				mapJson.put("status", "yesSol");
			}
		}
		return mapJson;
	}
	
	/* 해결중&해결완료 수정*/
	@RequestMapping("/helper/updateSol")
	@ResponseBody
	public Map<String, Object> getSol(HelperVO sol, HttpSession session){
		log.debug("<해결토글> : " + sol);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noSol");
		}else {
			//로그인된 회원번호 셋팅
			sol.setMem_num(user.getMem_num());
			
			//이전에 버튼을 클릭했는지 여부 - 토글형태로 하기 위해
			HelperVO helperSol = helperService.selectSolution(sol);
			
			//변경 결과에 따라 다른 결과 전송
			if(helperSol.getHelper_solution() == 0) {//해결완료로 수정
				helperService.updateSolution1(sol);
				mapJson.put("status", "yesSol");
			}else {
				helperService.updateSolution0(sol);
				mapJson.put("status", "noSol");
			}
		}
		return mapJson;
	}
}






















