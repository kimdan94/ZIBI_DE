package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.performance.dao.PerformanceMapper;
import kr.spring.performance.vo.ChoiceVO;
import kr.spring.performance.vo.CinemaVO;
import kr.spring.performance.vo.PerformanceVO;
import kr.spring.performance.vo.TicketingVO;

@Service
@Transactional
public class PerformanceServiceImpl implements PerformanceService {
	@Autowired
	private PerformanceMapper performanceMapper;

	@Override
	public void insertPerformance(PerformanceVO performance) {
		performanceMapper.insertPerformance(performance);
	}

	@Override
	public List<PerformanceVO> selectList(Map<String, Object> map) {
		return performanceMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return performanceMapper.selectRowCount(map);
	}

	@Override
	public void insertCinema(CinemaVO cinema) {
		performanceMapper.insertCinema(cinema);
	}

	@Override
	public List<CinemaVO> selectCinemaLoc1() {
		return performanceMapper.selectCinemaLoc1();
	}

	@Override
	public List<CinemaVO> selectCinemaLoc2(Map<String, Object> map) {
		return null;
		
	}

	@Override
	public List<CinemaVO> selectLocation2(String loc1) {
		return performanceMapper.selectLocation2(loc1);
	}

	@Override
	public void insertDate(TicketingVO ticketing) {
		performanceMapper.insertDate(ticketing);
		
	}

	@Override
	public List<CinemaVO> selectCinemaNum(String cinema_location2) {
		return performanceMapper.selectCinemaNum(cinema_location2);
	}

	@Override
	public List<TicketingVO> selectPerformance(int cinema_num) {
		return performanceMapper.selectPerformance(cinema_num);
	}

	@Override
	public List<TicketingVO> selectDate() {
		return performanceMapper.selectDate();
	}

	@Override
	public List<CinemaVO> selectCinemaWithTicketing(Map<String, Object> map) {
		return performanceMapper.selectCinemaWithTicketing(map);
	}

	@Override
	public List<PerformanceVO> selectPerformanceWithTicketing(Map<String, Object> map) {
		return performanceMapper.selectPerformanceWithTicketing(map);
	}

	@Override
	public List<TicketingVO> selectWithTicketing(Map<String, Object> map) {
		return performanceMapper.selectWithTicketing(map);
	}

	@Override
	public List<CinemaVO> adminSelectLocation(String loc1) {
		return performanceMapper.adminSelectLocation(loc1);
	}

	@Override
	public List<CinemaVO> pickCinema(Map<String, Object> map) {
		return performanceMapper.pickCinema(map);
	}

	@Override
	public List<PerformanceVO> pickPerformance(Map<String, Object> map) {
		return performanceMapper.pickPerformance(map);
	}

	@Override
	public List<TicketingVO> pickTicketing(Map<String, Object> map) {
		return performanceMapper.pickTicketing(map);
	}

	@Override
	public List<ChoiceVO> selectChoice(Map<String, Object> map) {
		return performanceMapper.selectChoice(map);
	}

	@Override
	public TicketingVO choosingTicketing(Map<String, Object> map) {
		return performanceMapper.choosingTicketing(map);
	}


	
	
	
}
