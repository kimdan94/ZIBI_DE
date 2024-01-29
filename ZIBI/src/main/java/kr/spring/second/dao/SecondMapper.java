package kr.spring.second.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
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
	
	//찜
	@Select("SELECT * FROM second_fav WHERE sc_num=#{sc_num} AND mem_num=#{mem_num}")
	public SecondFavVO selectFav(SecondFavVO fav);//한건의 데이터 읽어옴
	@Select("SELECT COUNT(*) FROM second_fav WHERE sc_num=#{sc_num}")
	public int selectFavCount(int sc_num);//sc_num의 좋아요 수 구하기
	@Insert("INSERT INTO second_fav (sc_num,mem_num) VALUES (#{sc_num},#{mem_num})")
	public void insertFav(SecondFavVO fav);
	@Delete("DELETE FROM second_fav WHERE sc_num=#{sc_num} AND mem_num=#{mem_num}")
	public void deleteFav(SecondFavVO secondFav);
	@Delete("DELETE FROM second_fav WHERE sc_num=#{sc_num}")
	public void deleteFavByScNum(int sc_num);//상세글 지울떄 찜 지우기 위해
	
	//=========  중고거래 마이페이지   ==================
		//판매내역 - 전체 
	public List<SecondVO> selectMyscList(Map<String,Object> map);
	public int selectMyscRowCount(Map<String,Object> map);//로그인한 사람의 판매글 전체 레코드 수 
	
	//=========  중고거래 채팅   ==================
}
