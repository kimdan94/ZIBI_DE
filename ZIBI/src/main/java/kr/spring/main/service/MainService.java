package kr.spring.main.service;

import java.util.List;

import kr.spring.main.vo.LastestContentVO;
import kr.spring.performance.vo.PerformanceVO;

public interface MainService {
	
	//최신 글 갯수
	public int selectLastestContentCount();
	
	//최신 글 읽기
	public List<LastestContentVO> selectLastestContent();
	
	//영화 최신 글
	public PerformanceVO selectLastestPerformance();
}
