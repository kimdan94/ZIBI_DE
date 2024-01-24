package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;

public interface PerformanceService {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	public List<CinemaVO> selectCinemaLoc1();
	public List<CinemaVO> selectCinemaLoc2(Map<String, Object> map);
	
	// 관리자
	public void insertPerformance(PerformanceVO performance);
	public void insertCinema(CinemaVO cinema);
	public List<CinemaVO> selectLocation2(String loc1);
	
}
