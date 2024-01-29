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
	
	//찜
	public SecondFavVO selectFav(SecondFavVO fav);//한건의 데이터 읽어옴
	public int selectFavCount(int sc_num);
	public void insertFav(SecondFavVO fav);
	public void deleteFav(SecondFavVO secondFav);
	
	//=========  중고거래 마이페이지   ==================
		//판매내역 - 전체 
	public List<SecondVO> selectMyscList(Map<String,Object> map);
	public int selectMyscRowCount(Map<String,Object> map);//로그인한 사람의 판매글 전체 레코드 수 
	
	//=========  중고거래 채팅   ==================
}
