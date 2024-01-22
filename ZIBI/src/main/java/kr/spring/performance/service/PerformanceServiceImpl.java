package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.performance.dao.PerformanceMapper;
import kr.spring.performance.vo.PerformanceVO;

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

	
	
}
