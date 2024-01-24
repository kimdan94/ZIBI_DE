package kr.spring.second.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import kr.spring.member.vo.MemberVO;
import kr.spring.second.service.SecondService;
import kr.spring.second.vo.SecondVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecondController {
	@Autowired
	private SecondService secondService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public SecondVO initCommand() {
		return new SecondVO();
	}
	
	/*================================
	 * 중고거래 글 등록
	 *================================*/
	//등록 폼 호출
	@GetMapping("/secondhand/write") 
	public ModelAndView scwriteform() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageName", "상품 등록"); 
		mav.setViewName("secondWrite"); //타일스
		return mav; //타일스
	}
	
	//등록폼 전송된 데이터 처리 
	@PostMapping("/secondhand/write")
	public String scwritesubmit(@Valid SecondVO secondVO, BindingResult result,
						HttpServletRequest request , HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<중고거래 글 저장>> : " + secondVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "secondWrite"; //타일스
		}
		
		//회원 번호 셋팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		
		secondVO.setMem_num(vo.getMem_num());
		//ip 셋팅
		secondVO.setSc_ip(request.getRemoteAddr());
		//파일 업로드
		secondVO.setSc_filename(FileUtil.createFile(request, secondVO.getUpload()));
		
		//글쓰기   
		secondService.insertSecond(secondVO);
		
		//View에 표시할 메시지 
		//model.addAttribute("message", "상품 등록이 완료되었습니다.");
		//model.addAttribute("url", request.getContextPath()+"/secondhand/secondList");
		
		return "redirect:/secondhand/list";
	}
	/*================================
	 * 중고거래 글 목록
	 *================================*/
	@RequestMapping("/secondhand/list")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="order",defaultValue="1") int order,//정렬 기능
			String keyfield, String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드 수
		int count = secondService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		//페이지 처리
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,4,10,"list");
		
		//목록 읽어오기
		List<SecondVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = secondService.selectList(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("secondMain"); //타일스
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	/*================================
	 * 중고거래 글 상세
	 *================================*/
	@RequestMapping("/secondhand/detail")
	public ModelAndView process(@RequestParam int sc_num) {
		log.debug("<<중거고래 글 상세 sc_num>> : " + sc_num);
		
		//해당 글의 조회수 증가
		secondService.updateHit(sc_num);
		
		SecondVO second = secondService.selectSecond(sc_num);
		
		//제목에 태그를 허용하지 않음
		second.setSc_title(StringUtil.useNoHtml(second.getSc_title()));
		
		String extractedAddress = extractAddress(second.getSc_address());
        second.setSc_address(extractedAddress);
		
		return new ModelAndView("secondDetail","second",second);
	}//second에 mem_num, sc_num, sc_title, sc_content, sc_category,sc_price,sc_status,sc_way,sc_place,위도,경도,조회수,등록일 등 정보 있음
	
	private String extractAddress(String originalAddress) {
        // 정규표현식 패턴
        Pattern pattern = Pattern.compile("([가-힣\\s]+[읍면동가-힣]+).*");

        // 정규표현식에 맞는 부분 추출
        Matcher matcher = pattern.matcher(originalAddress);

        // 주소 반환
        if (matcher.find()) {
            return matcher.group(1);
        } else {
            return originalAddress; // 매칭되는 부분이 없을 경우 원래 주소를 반환
        }
    }
	
	
	/*================================
	 * 중고거래 채팅방 목록
	 *================================*/
	@RequestMapping("/secondhand/secondChatList")
	public String scChatList() {
		return "secondChatList";
	}
	
}








