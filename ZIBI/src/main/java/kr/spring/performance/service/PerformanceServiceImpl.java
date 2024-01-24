package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.performance.dao.PerformanceMapper;
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

	
	
}
