package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import kr.spring.book.vo.BookVO;

public interface BookService {
	//부모글
	public List<BookVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBook(BookVO book);
	public BookVO selectBook(int book_num);
	public void updateBook(BookVO book);
	public void deleteBook(int book_num);
	public void deleteFile(int book_num);

	//매칭
	//리뷰
	//스크랩
}
