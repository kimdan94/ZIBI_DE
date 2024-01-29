package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import kr.spring.book.vo.BookMatchingVO;
import kr.spring.book.vo.BookVO;

public interface BookService {
	/*------- 부모글 -------*/
	public List<BookVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBook(BookVO book);
	public BookVO selectBook(int book_num);
	public void updateBook(BookVO book);
	//모임글 삭제 - 참여 인원이 없을 경우만 가능
	public void deleteBook(int book_num);
	public void deleteFile(int book_num);
	//모임 취소 - 참여 인원이 있을 때 사용
	public void cancelBook(int book_num);
	
	/*------- 예약 내역(나의 모임) -------*/
	public List<BookVO> selectMatchList(Map<String,Object> map);
	public int selectMatchCount(Map<String,Object> map);
	
	/*------- 매칭 -------*/
	//참여 신청하기
	public void insertMatch(BookMatchingVO bookMatchingVO);
	//일정 중복 여부 체크하기
	public BookMatchingVO selectMatch(String book_gatheringDate);
	//참여 취소하기
	public void deleteMatch(int book_num, int apply_num);
	//예약 승인하기
	public void approveMatch(int book_num, int apply_num);
	//예약 거절하기
	public void denyMatch(int book_num, int apply_num);
	
	//리뷰
	//스크랩
}
