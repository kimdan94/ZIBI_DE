package kr.spring.second.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.spring.second.vo.SecondFavVO;
import kr.spring.second.vo.SecondVO;

@Mapper
public interface SecondMapper {
	//부모글
	public List<SecondVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertSecond(SecondVO second);
	public SecondVO selectSecond(int sc_num);
	@Update("UPDATE second SET sc_hit=sc_hit+1 WHERE sc_num=#{sc_num}")
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
