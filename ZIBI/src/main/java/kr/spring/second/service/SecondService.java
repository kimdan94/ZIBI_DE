package kr.spring.second.service;

import java.util.List;
import java.util.Map;

import kr.spring.second.vo.SecondFavVO;
import kr.spring.second.vo.SecondVO;

public interface SecondService {
	//부모글
	public List<SecondVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertSecond(SecondVO second);
	public SecondVO selectSecond(int sc_num);
	public void updateHit(int sc_num);
	public void updateSecond(SecondVO second);
	public void deleteSecond(int sc_num);
	public void deleteFile(int sc_num);
	
	//좋아요
	public SecondFavVO selectFav(SecondFavVO fav);//한건의 데이터 읽어옴
	public int selectFavCount(int sc_num);
	public void insertFav(SecondFavVO fav);
	public void deleteFav(SecondFavVO secondFav);
}
