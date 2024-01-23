package kr.spring.helper.controller;

import java.util.HashMap;
import java.util.List;
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

import ch.qos.logback.core.util.FileUtil;
import kr.spring.helper.service.HelperService;
import kr.spring.helper.vo.HelperVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HelperController {
	@Autowired
	private HelperService helperService;
	
	/*게시판 글 등록*/
	//자바빈(VO)초기화
	@ModelAttribute
	public HelperVO initCommand() {
		return new HelperVO();
	}
	
	//글 등록 폼 호출
	@GetMapping("/helper/write")
	public String form() {
		return "helperWrite";//타일스 설정
	}
	
	//글 등록
	@PostMapping("/helper/write")
	public String submit(@Valid HelperVO helperVO, BindingResult result,
						  HttpServletRequest request, HttpSession session,
						  Model model) {
		log.debug("<게시판 글 등록> : " + helperVO);
		
		//유효성 체크 결과 오류가 있을 시 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호 셋팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		helperVO.setMem_num(vo.getMem_num());
		//ip 셋팅
		helperVO.setHelper_ip(request.getRemoteAddr());
		//파일 업로드 ?
		//helperVO.setHelper_filename(FileUtil.)
		//글작성
		helperService.insertHelper(helperVO);
		
		//View에 표시할 메세지 지정
		model.addAttribute("message", "글이 작성되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/helper/list");
		
		return "common/resultAlert";
	}
	
	/*게시판 글 목록*/
	@RequestMapping("/helper/list")
	public ModelAndView process(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="order",defaultValue="1") int order,
			String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체&검색 레코드 수
		int count = helperService.selectRowCount(map);
		log.debug("<count> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<HelperVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = helperService.selectList(map);
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("helperList");//타일스 설정
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	

}


















