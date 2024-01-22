package kr.spring.performance.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.performance.vo.PerformanceVO;

@Mapper
public interface PerformanceMapper {

	public void insertPerformance(PerformanceVO performance);
}
