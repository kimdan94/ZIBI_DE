package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;
import kr.spring.performance.vo.TicketingVO;

public interface PerformanceService {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	public List<CinemaVO> selectCinemaLoc1();
	public List<CinemaVO> selectCinemaLoc2(Map<String, Object> map);
	public List<CinemaVO> selectCinemaNum(String cinema_location2);
	public List<TicketingVO> selectPerformance(int cinema_num);
	public List<TicketingVO> selectDate();
	
	public List<CinemaVO> selectCinemaWithTicketing(int cinema_num, String day);
	public List<PerformanceVO> selectPerformanceWithTicketing(int cinema_num, String day);
	public List<TicketingVO> selectWithTicketing(int cinema_num, String day);
	
	// 관리자
	public void insertPerformance(PerformanceVO performance);
	public void insertCinema(CinemaVO cinema);
	public List<CinemaVO> selectLocation2(String loc1);
	public void insertDate(TicketingVO ticketing);
	
}
