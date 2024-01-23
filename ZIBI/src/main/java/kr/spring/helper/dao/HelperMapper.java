package kr.spring.helper.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.helper.vo.HelperVO;

@Mapper
public interface HelperMapper {
	public List<HelperVO> selectList(Map<String,Object> map);//글 목록
	public int selectRowCount(Map<String,Object> map);
	public void insertHelper(HelperVO helper);
	public HelperVO selectHelper(int helper_num);
	public void updateHit(int helper_num);
	public void updateHelper(HelperVO helper);
	public void deleteHelper(int helper_num);
	
	//스크랩
	
}
