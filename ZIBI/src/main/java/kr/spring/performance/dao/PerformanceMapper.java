package kr.spring.performance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.performance.vo.PerformanceVO;

@Mapper
public interface PerformanceMapper {
	// 사용자
	public List<PerformanceVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	
	// 관리자
	public void insertPerformance(PerformanceVO performance);
	
}
