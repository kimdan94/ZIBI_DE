package kr.spring.book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.service.BookService;
import kr.spring.book.vo.BookVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BookController {
	@Autowired
	private BookService bookService;
	
	/*-- 예약 게시글 등록 --*/
	//VO 초기화
	@ModelAttribute
	public BookVO initCommand() {
		return new BookVO();
	}
	
	//등록 폼 호출
	@GetMapping("/book/write")
	public ModelAndView form(HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookWrite");
		mav.addObject("pageName", "소모임 예약");
		mav.addObject("mem_nickname", user.getMem_nickname());
		
		return mav;
	}
	
	//전송된 데이터 처리
	@PostMapping("/book/write")
	public String submit(@Valid BookVO bookVO,BindingResult result,
							HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException {
		
		//유효성 체크 결과 오류 발생 시 폼 호출
		if(result.hasErrors()) {
			return "bookWrite";
		}
		
		//회원 번호 세팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		bookVO.setMem_num(vo.getMem_num());
		//ip 세팅
		bookVO.setBook_ip(request.getRemoteAddr());
		//썸네일 업로드
		if(bookVO.getBook_thumbnailName()!=null) {
			bookVO.setBook_thumbnailName(FileUtil.createFile(request, bookVO.getUpload()));
		}else {
			bookVO.setBook_thumbnailName(null);
		}
		//소개 이미지 업로드
		if(bookVO.getBook_fileName()!=null) {
			bookVO.setBook_fileName(FileUtil.createFile(request, bookVO.getUpload()));
		}
		//글쓰기
		bookService.insertBook(bookVO);
		
		/*---상세글로 이동 예정(수정 필요)---*/
		return "bookList";
	}
	
	/*-- 예약 게시글 목록 --*/
	@RequestMapping("/book/list")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue = "1") int currentPage,
			String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookList");
		mav.addObject("pageName","소모임 예약");
		
		return mav;
	}
}
