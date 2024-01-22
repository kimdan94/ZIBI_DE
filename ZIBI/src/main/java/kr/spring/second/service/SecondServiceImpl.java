package kr.spring.second.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.second.dao.SecondMapper;
import kr.spring.second.vo.SecondFavVO;
import kr.spring.second.vo.SecondVO;

@Service
@Transactional
public class SecondServiceImpl implements SecondService{
	@Autowired
	private SecondMapper secondMapper;
	
	//중고거래 전체 목록/검색 목록
	@Override
	public List<SecondVO> selectList(Map<String, Object> map) {
		return secondMapper.selectList(map);
	}
	//중고거래 글의 총개수/검색 개수
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return secondMapper.selectRowCount(map);
	}

	@Override
	public void insertSecond(SecondVO second) {
		secondMapper.insertSecond(second);
	}

	@Override
	public SecondVO selectSecond(int sc_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(int sc_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSecond(SecondVO second) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSecond(int sc_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(int sc_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SecondFavVO selectFav(SecondFavVO fav) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectFavCount(int sc_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFav(SecondFavVO fav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFav(SecondFavVO secondFav) {
		// TODO Auto-generated method stub
		
	}
	
}
