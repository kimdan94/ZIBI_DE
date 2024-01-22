package kr.spring.performance.service;

import java.util.List;
import java.util.Map;

import kr.spring.performance.vo.PerformanceVO;

public interface PerformanceService {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	
	// 관리자
	public void insertPerformance(PerformanceVO performance);
	
	
}
