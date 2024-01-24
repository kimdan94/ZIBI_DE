package kr.spring.performance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;

@Mapper
public interface PerformanceMapper {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT cinema_location1 FROM cinema GROUP BY cinema_location1")
	public List<CinemaVO> selectCinemaLoc1();
	public List<CinemaVO> selectCinemaLoc2(Map<String, Object> map);
	
	
	// 관리자
	public void insertPerformance(PerformanceVO performance); // 영화 정보 저장
	public void insertCinema(CinemaVO cinema); // 상영관 정보 저장
	
}
