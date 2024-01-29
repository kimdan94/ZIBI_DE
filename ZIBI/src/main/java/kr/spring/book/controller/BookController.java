package kr.spring.book.controller;

import java.io.IOException;
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

import kr.spring.book.service.BookService;
import kr.spring.book.vo.BookVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil_cust;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BookController {
	@Autowired
	private BookService bookService;

	/*-- 예약 게시글 등록 --*/
	// VO 초기화
	@ModelAttribute
	public BookVO initCommand() {
		return new BookVO();
	}

	// 등록 폼 호출
	@GetMapping("/book/write")
	public ModelAndView form(HttpSession session) {

		MemberVO user = (MemberVO) session.getAttribute("user");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookWrite");
		mav.addObject("mem_nickname", user.getMem_nickname());

		return mav;
	}

	// 전송된 데이터 처리
	@PostMapping("/book/write")
	public String submit(@Valid BookVO bookVO, BindingResult result, HttpServletRequest request, HttpSession session,
			Model model) throws IllegalStateException, IOException {

		MemberVO user = (MemberVO) session.getAttribute("user");

		// 유효성 체크 결과 오류 발생 시 폼 호출
		if(result.hasErrors()) {
			model.addAttribute("mem_nickname", user.getMem_nickname());
			return "bookWrite";
		}

		// 회원 번호 세팅
		bookVO.setMem_num(user.getMem_num());
		// ip 세팅
		bookVO.setBook_ip(request.getRemoteAddr());
		// 썸네일 업로드
		bookVO.setBook_thumbnailName(FileUtil.createFile(request, bookVO.getUpload()));

		// 글쓰기
		bookService.insertBook(bookVO);

		return "redirect:/book/list";
	}

	/*-- 예약 게시글 목록 --*/
	@RequestMapping("/book/list")
	public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "order", defaultValue = "1") int order, 
			String keyfield, String keyword, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		// 전체/검색 레코드 수
		int count = bookService.selectRowCount(map);

		PageUtil_cust page = new PageUtil_cust(keyfield, keyword, currentPage, count, 4, 10, "list", "&order=" + order);
		List<BookVO> list = null;
		if (count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = bookService.selectList(map);
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		
		if(user!=null) {// 로그인 시에만 나의 예약 목록 출력
			Map<String,Object> map2 = new HashMap<String,Object>();
			map2.put("mem_num", user.getMem_num());
			
			// 예약 레코드 수
			int mcount = bookService.selectMatchCount(map2);
			
			PageUtil_cust mpage = new PageUtil_cust(currentPage, mcount, 5, 10, "list");
			List<BookVO> mlist = null;
			if(count > 0) {
				map2.put("mstart", mpage.getStartRow());
				map2.put("mend", mpage.getEndRow());
				
				mlist = bookService.selectMatchList(map2);
			}
			mav.addObject("mcount",mcount);
			mav.addObject("mlist",mlist);
			mav.addObject("mpage", page.getPage());
		}
		
		mav.setViewName("bookList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav;
	}
	
	/*-- 예약 게시글 상세 --*/
	@RequestMapping("/book/detail")
	public ModelAndView process(@RequestParam int book_num) {
		BookVO book = bookService.selectBook(book_num);
		// 제목 html 불허
		book.setBook_title(StringUtil.useNoHtml(book.getBook_title()));
		// book_state 세팅
		if(book.getBook_match()==2) {
			int book_state = 0;
			book.setBook_state(book_state);
		}else {
			int book_state = 1;
			book.setBook_state(book_state);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookDetail");
		mav.addObject("book", book);

		return mav;
	}
	
	/*-- 예약 게시글 수정 --*/
	// 수정 폼 호출
	@GetMapping("/book/update")
	public String formUpdate(@RequestParam int book_num,Model model,
							HttpSession session) {
		BookVO bookVO = bookService.selectBook(book_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("mem_nickname", user.getMem_nickname());
		
		return "bookUpdate";
	}
	
	// 전송된 데이터 처리
	@PostMapping("/book/update")
	public String submitUpdate(@Valid BookVO bookVO,BindingResult result,
							HttpServletRequest request, HttpSession session,
							Model model) throws IllegalStateException, IOException {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			model.addAttribute("mem_nickname", user.getMem_nickname());
			// 파일정보 재세팅
			BookVO vo = bookService.selectBook(bookVO.getBook_num());
			bookVO.setBook_thumbnailName(vo.getBook_thumbnailName());
			return "bookUpdate";
		}
		
		// DB에 저장된 썸네일 정보 백업
		BookVO db_book = bookService.selectBook(bookVO.getBook_num());
		
		// 파일명 세팅
		bookVO.setBook_thumbnailName(FileUtil.createFile(request, bookVO.getUpload()));
		// ip 세팅
		bookVO.setBook_ip(request.getRemoteAddr());
		
		// 글 수정
		bookService.updateBook(bookVO);
		
		// 새로 전송된 파일명이 있을 경우 이전 파일 삭제
		if(bookVO.getUpload() != null && !bookVO.getUpload().isEmpty()) {
			// 수정 전 파일 삭제
			FileUtil.removeFile(request, db_book.getBook_thumbnailName());
		}
		return "redirect:/book/list";
	}
}