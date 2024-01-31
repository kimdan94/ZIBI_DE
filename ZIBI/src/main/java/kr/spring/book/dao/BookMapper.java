package kr.spring.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.book.vo.BookMatchingVO;
import kr.spring.book.vo.BookVO;

@Mapper
public interface BookMapper {
	/*------- 부모글 -------*/
	public List<BookVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBook(BookVO book);
	public BookVO selectBook(int book_num);
	public void updateBook(BookVO book);
	@Update("UPDATE book SET book_thumbnailName='' WHERE book_num=#{book_num}")
	public void deleteFile(int book_num);
	//모임 취소
	@Update("UPDATE book SET book_onoff = 2 WHERE book_num=#{book_num}")
	public void cancelBook(int book_num);
	
	/*------- 예약 내역(나의 모임) -------*/
	public List<BookVO> selectMatchList(Map<String,Object> map);
	public int selectMatchCount(Map<String,Object> map);
	
	/*------- 매칭 -------*/
	//참여 신청하기
	@Insert("INSERT INTO book_matching (book_num, apply_num, book_state, apply_gatheringDate) VALUES (#{book_num},#{apply_num},#{book_state},#{apply_gatheringDate})")
	public void insertMatch(BookMatchingVO bookMatchingVO);
	//참여 인원 +1
	@Update("UPDATE book SET book_headcount=book_headcount+1 WHERE book_num=#{book_num}")
	public void addMatch(int book_num);
	//일정 중복 여부 체크하기
	@Select("SELECT * FROM book_matching WHERE apply_gatheringDate=#{book_gatheringDate} AND apply_num=#{apply_num}")
	public BookMatchingVO selectMatch(String book_gatheringDate, int apply_num);
	
	//참여 취소하기
	@Delete("DELETE FROM book_matching WHERE book_num=#{book_num} AND apply_num=#{apply_num}")
	public void deleteMatch(int book_num, int apply_num);
	//참여 인원 -1
	@Update("UPDATE book SET book_headcount=book_headcount-1 WHERE book_num=#{book_num}")
	public void cancelMatch(int book_num);
	
	//예약 승인하기
	@Update("UPDATE book_matching SET book_state = 1 WHERE book_num=#{book_num} AND apply_num=#{apply_num}")
	public void approveMatch(int book_num, int apply_num);
	//예약 거절하기
	@Update("UPDATE book_matching SET book_state = 2 WHERE book_num=#{book_num} AND apply_num=#{apply_num}")
	public void denyMatch(int book_num, int apply_num);
	
	//모집 완료하기(참여 신청 일괄 거절하기)
	@Update("UPDATE book_matching SET book_state = 2 WHERE book_num=#{book_num} AND book_state = 0")
	public void denyAllMatch(int book_num);
	@Update("UPDATE book SET book_onoff = 3 WHERE book_num=#{book_num}")
	public void updateOnoff3(int book_num);
	
	//모임 완료하기
	@Update("UPDATE book SET book_onoff = 1 WHERE book_num=#{book_num}")
	public void updateOnoff1(int book_num);
	
	//다시 모집하기

	//리뷰
	//스크랩
}
