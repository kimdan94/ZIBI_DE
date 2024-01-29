package kr.spring.helper.service;

import java.util.List;
import java.util.Map;

import kr.spring.helper.vo.HelperScrapVO;
import kr.spring.helper.vo.HelperVO;

public interface HelperService {
	public List<HelperVO> selectList(Map<String,Object> map);//글 목록
	public int selectRowCount(Map<String,Object> map);
	public void insertHelper(HelperVO helper);
	public HelperVO selectHelper(int helper_num);
	public void updateHit(int helper_num);
	public void updateHelper(HelperVO helper);
	public void deleteHelper(int helper_num);
	public void deleteFile(int helper_num);
	
	//스크랩
	public HelperScrapVO selectscrap(HelperScrapVO scrap);
	public int selectScrapCount(int helper_num);
	public void insertScrap(HelperScrapVO scrap);
	public void deleteScrap(HelperScrapVO helperScrap);
	
	//해결중&완료
	public HelperVO selectSolution(HelperVO solution);
	public void updateSolution0(HelperVO sol);
	public void updateSolution1(HelperVO sol);
}
