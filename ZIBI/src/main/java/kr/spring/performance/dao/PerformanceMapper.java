package kr.spring.performance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;
import kr.spring.performance.vo.TicketingVO;

@Mapper
public interface PerformanceMapper {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT cinema_location1 FROM cinema GROUP BY cinema_location1")
	public List<CinemaVO> selectCinemaLoc1();
	public List<CinemaVO> selectCinemaLoc2(Map<String, Object> map);
	@Select("SELECT cinema_num FROM cinema WHERE cinema_location2=#{cinema_location2}")
	public List<CinemaVO> selectCinemaNum(String cinema_location2); // 지역이름으로 지역번호 찾기
	@Select("SELECT * FROM ticketing WHERE cinema_num=#{cinema_num}")
	public List<TicketingVO> selectPerformance(int cinema_num);
	@Select("SELECT DISTINCT ticketing_date FROM ticketing")
	public List<TicketingVO> selectDate();
	
	// 상영관 + 날짜 + 영화로 예매할 수 있는 정보 출력
	public List<CinemaVO> selectCinemaWithTicketing(Map<String, Object> map);
	public List<PerformanceVO> selectPerformanceWithTicketing(Map<String, Object> map);
	public List<TicketingVO> selectWithTicketing(Map<String, Object> map);
	
	
	
	
	// 관리자
	public void insertPerformance(PerformanceVO performance); // 영화 정보 저장
	public void insertCinema(CinemaVO cinema); // 상영관 정보 저장
//	@Select("SELECT * FROM cinema WHERE cinema_location1=#{loc1}")
	@Select("SELECT DISTINCT cinema_location1, cinema_location2 FROM cinema WHERE cinema_location1=#{loc1}")
	public List<CinemaVO> selectLocation2(String loc1); // 지역1에 따른 지역2 출력

	@Select("SELECT * FROM cinema WHERE cinema_location1=#{loc1}")
	public List<CinemaVO> adminSelectLocation(String loc1);
	public void insertDate(TicketingVO ticketing);
	
}
