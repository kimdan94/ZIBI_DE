package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import kr.spring.book.vo.BookMatchingVO;
import kr.spring.book.vo.BookReviewVO;
import kr.spring.book.vo.BookScrapVO;
import kr.spring.book.vo.BookVO;

public interface BookService {
	/*------- 부모글 -------*/
	public List<BookVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBook(BookVO book);
	public BookVO selectBook(int book_num);
	public void updateBook(BookVO book);
	public void cancelBook(int book_num);
	public void deleteFile(int book_num);
	
	/*------- 예약 내역(나의 모임) -------*/
	public List<BookVO> selectMatchList(Map<String,Object> map);
	public int selectMatchCount(Map<String,Object> map);
	
	/*------- 매칭 -------*/
	//참여 신청하기
	public void insertMatch(BookMatchingVO bookMatchingVO);
	//일정 중복 여부 체크하기
	public BookMatchingVO selectMatch(String book_gatheringDate, int apply_num);
	
	//참여 취소하기
	public void deleteMatch(int book_num, int apply_num);
	
	//예약 승인하기
	public void approveMatch(int book_num, int apply_num);
	//예약 거절하기
	public void denyMatch(int book_num, int apply_num);
	
	//모집 마감하기
	public void denyAllMatch(int book_num);
	
	//모임 완료하기
	public void updateOnoff1(int book_num);
	
	//새로 모집하기
	public void resetOnoff(int book_num);
	
	/*------- 리뷰 -------*/
	public int selectRevByrev_num(int book_num, int apply_num, String apply_gatheringDate);
	public List<BookReviewVO> selectListRev(Map<String,Object> map);
	public int selectRevCount(Map<String,Object> map);
	public BookReviewVO selectRev(int rev_num);
	public void insertRev(BookReviewVO rev);
	public void updateRepv(BookReviewVO rev);
	public void deleteReply(int rev_num);
	public BookMatchingVO selectMatchForRev(int book_num, int apply_num, String apply_gatheringDate);
	
	/*------- 스크랩 -------*/
	public BookScrapVO selectScrap(BookScrapVO scrap);
	public int selectScrapCount(int book_num);
	public void insertScrap(BookScrapVO scrap);
	public void deleteScrap(BookScrapVO scrapVO);
}
