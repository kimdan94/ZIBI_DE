package kr.spring.checklist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.checklist.vo.CheckListVO;

@Mapper
public interface CheckListMapper {
	public List<CheckListVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertCheckList(CheckListVO CheckList);
	public CheckListVO selectCheckList(int Check_id);
}
