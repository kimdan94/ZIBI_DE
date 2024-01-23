package kr.spring.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.book.vo.BookVO;

@Mapper
public interface BookMapper {
	//부모글
	public List<BookVO> selectList(Map<String,Object> map);
	public int selectRowCound(Map<String,Object> map);
	public void insertBook(BookVO book);
	public BookVO selectBook(int book_num);
	public void updateBook(BookVO book);
	public void deleteBook(int book_num);
	public void deleteFile(int book_num);
	
	//매칭
	//리뷰
	//스크랩
}
