package kr.spring.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.main.dao.MainMapper;
import kr.spring.main.vo.LastestContentVO;
import kr.spring.performance.vo.PerformanceVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainMapper mainMapper;
	
	@Override
	public List<LastestContentVO> selectLastestContent() {
		return mainMapper.selectLastestContent();
	}

	@Override
	public int selectLastestContentCount() {
		return mainMapper.selectLastestContentCount();
	}

	@Override
	public PerformanceVO selectLastestPerformance() {
		return mainMapper.selectLastestPerformance();
	}
}
