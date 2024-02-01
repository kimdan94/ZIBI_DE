package kr.spring.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.main.vo.LastestContentVO;
import kr.spring.performance.vo.PerformanceVO;

@Mapper
public interface MainMapper {
	
	//최신 글 갯수
	public int selectLastestContentCount();
	
	//최신 글 읽기
	public List<LastestContentVO> selectLastestContent();
	
	//영화 최신 글
	@Select("SELECT * FROM (SELECT * FROM performance ORDER BY performance_start_date DESC) WHERE ROWNUM=1")
	public PerformanceVO selectLastestPerformance();
	
}
