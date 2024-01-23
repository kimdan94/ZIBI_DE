package kr.spring.helper.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.helper.dao.HelperMapper;
import kr.spring.helper.vo.HelperVO;
@Service
@Transactional
public class HelperServiceImpl implements HelperService{
	@Autowired
	private HelperMapper helperMapper;
	
	@Override
	public List<HelperVO> selectList(Map<String, Object> map) {
		return helperMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return helperMapper.selectRowCount(map);
	}

	@Override
	public void insertHelper(HelperVO helper) {
		helperMapper.insertHelper(helper);
	}

	@Override
	public HelperVO selectHelper(int helper_num) {
		return null;
	}

	@Override
	public void updateHit(int helper_num) {
		
	}

	@Override
	public void updateHelper(HelperVO helper) {
		
	}

	@Override
	public void deleteHelper(int helper_num) {
		
	}

}
