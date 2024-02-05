package kr.spring.policy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.policy.service.PolicyService;
import kr.spring.policy.vo.PolicyVO;
import kr.spring.util.PageUtil_na;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PolicyController {
	
	@Autowired
	private PolicyService policyService;
	
	//초기화
	@ModelAttribute
	public PolicyVO initPolicy() {
		return new PolicyVO();
	}
	
	//카카오 앱키 호출
	@Value("${NA-API-KEY.kakaoAppKey}")
	private String kakao_apikey;
	
	/* ---------- 사용자 - 1인 가구 비율 ----------*/
	@RequestMapping("/policy/policyCount")
	public String policyCount(Model model) {
		
		List<PolicyVO> list = policyService.selectStatsList();
		
		model.addAttribute("list",list);
		model.addAttribute("apikey", kakao_apikey);
				
		return "policyCount";
	}
	
	/* ---------- 사용자 - 진입 (1인 가구 메인) ----------*/
	@RequestMapping("/policy/main")
	public String policyMain(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<PolicyVO> list = null;
		int count = policyService.selectPolicyCount();
		
		if(count>0) {
			list = policyService.selectPolicyList(map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("count", count);
		model.addAttribute("apikey", kakao_apikey);
		
		return "policyMain";
	}

	/* ---------- 관리자 페이지 - 진입 ----------*/
	@RequestMapping("/admin/policy")
	public String adminMain(Model model, @RequestParam(value = "pageNum",defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<PolicyVO> list = null;
		int count = policyService.selectPolicyCount();
		
		PageUtil_na page = new PageUtil_na(currentPage,count, 10, 10, "policy");
		
		if(count>0) {
			map.put("start",page.getStartRow());
			map.put("end",page.getEndRow());
			
			list = policyService.selectPolicyList(map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("page", page.getPage());
		model.addAttribute("count",count);
		
		return "adminPage";
	}
	
	/* ---------- 관리자 페이지 - 등록폼  ----------*/
	@GetMapping("/admin/policyInsert")
	public String adminPolicyInsertForm(Model model) {
		
		model.addAttribute("apikey", kakao_apikey);
		
		return "adminPolicyInsert";
	}
	
	/* ---------- 관리자 페이지 - 등록 submit  ----------*/
	@PostMapping("/admin/policyInsert")
	public String adminPolicyInsert(@Valid PolicyVO policyVO, BindingResult result) {
		
		log.debug("<<등록>> " + policyVO);
		
		if(result.hasErrors())
			return "adminPolicyInsert";
		
		if(policyVO.getPolicy_url().equals(""))
			policyVO.setPolicy_url("-");
		
		policyService.insertPolicy(policyVO);
		
		return "redirect:/admin/policy";
	}
	
	/* ---------- 관리자 페이지 - 수정  ----------*/
	@RequestMapping("/admin/policyModify")
	public String adminPolicyModifyForm(@RequestParam int district_num, Model model) {
		
		PolicyVO policyVO = policyService.selectPolicy(district_num);
		
		model.addAttribute("policyVO", policyVO);
		model.addAttribute("apikey", kakao_apikey);
		
		return "adminPolicyModify";
	}
	
	/* ---------- 관리자 페이지 - 수정 submit  ----------*/
	@RequestMapping("/admin/policyModifySubmit")
	public String adminPolicyModify(@Valid PolicyVO policyVO, BindingResult result) {
		
		log.debug("<<수정>> " + policyVO);
		
		if(result.hasErrors()) {
			return "adminPolicyModify";
		}
		
		policyService.updateDistrict(policyVO);
		
		if(!policyVO.getPolicy_url().equals("-"))
			policyService.updatePolicy(policyVO);
		
		return "redirect:/admin/policy";
	}
	
	/* ---------- 관리자 페이지 - 삭제  ----------*/
	@RequestMapping("/admin/policyDelete")
	public String adminDistrictDelete(@RequestParam int district_num, Model model) {
		
		policyService.deletePolicy(district_num);
	
		return "redirect:/admin/policy";
	}
		
}
