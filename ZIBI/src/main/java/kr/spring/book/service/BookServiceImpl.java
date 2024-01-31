package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.book.dao.BookMapper;
import kr.spring.book.vo.BookMatchingVO;
import kr.spring.book.vo.BookVO;

@Service
@Transactional
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;

	@Override
	public List<BookVO> selectList(Map<String, Object> map) {
		return bookMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return bookMapper.selectRowCount(map);
	}

	@Override
	public void insertBook(BookVO book) {
		bookMapper.insertBook(book);
	}

	@Override
	public BookVO selectBook(int book_num) {
		return bookMapper.selectBook(book_num);
	}

	@Override
	public void updateBook(BookVO book) {
		bookMapper.updateBook(book);
	}

	@Override
	public void deleteFile(int book_num) {
		bookMapper.deleteFile(book_num);
	}

	@Override
	public List<BookVO> selectMatchList(Map<String, Object> map) {
		return bookMapper.selectMatchList(map);
	}

	@Override
	public int selectMatchCount(Map<String, Object> map) {
		return bookMapper.selectMatchCount(map);
	}

	@Override
	public void insertMatch(BookMatchingVO bookMatchingVO) {
		//신청 인원수 반영
		bookMapper.addMatch(bookMatchingVO.getBook_num());
		bookMapper.insertMatch(bookMatchingVO);
	}

	@Override
	public void deleteMatch(int book_num, int apply_num) {
		//취소 인원수 반영
		bookMapper.cancelMatch(book_num);
		bookMapper.deleteMatch(book_num, apply_num);
	}

	@Override
	public void cancelBook(int book_num) {
		bookMapper.cancelBook(book_num);
	}

	@Override
	public void approveMatch(int book_num, int apply_num) {
		bookMapper.approveMatch(book_num, apply_num);
	}

	@Override
	public void denyMatch(int book_num, int apply_num) {
		//거절 인원수 반영
		bookMapper.cancelMatch(book_num);
		bookMapper.denyMatch(book_num, apply_num);
	}
	
	@Override
	public void denyAllMatch(int book_num) {
		//게시글 모집 완료 처리
		bookMapper.updateOnoff3(book_num);
		//대기 중인 나머지 참여 신청 일괄 거절
		bookMapper.denyAllMatch(book_num);
	}

	@Override
	public BookMatchingVO selectMatch(String book_gatheringDate, int apply_num) {
		return bookMapper.selectMatch(book_gatheringDate, apply_num);
	}

	@Override
	public void updateOnoff1(int book_num) {
		//대기 중인 나머지 참여 신청 일괄 거절
		bookMapper.denyAllMatch(book_num);
		//모임 완료 처리
		bookMapper.updateOnoff1(book_num);
	}
}
