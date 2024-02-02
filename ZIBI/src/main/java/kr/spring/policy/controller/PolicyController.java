package kr.spring.policy.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.policy.vo.PolicyVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PolicyController {
	
	//초기화
	@ModelAttribute
	public PolicyVO initPolicy() {
		return new PolicyVO();
	}
	
	/* ---------- 사용자 - 진입 (1인 가구 메인) ----------*/
	@RequestMapping("/policy/main")
	public String policyMain(Model model) {
		
		//policyVO 리스트 넘겨주기
		//리스트 반환 (페이징 처리 x)
		PolicyVO policyVO = new PolicyVO();
		
		policyVO.setDistrict_num(1);
		policyVO.setDistrict_name("서울");
		policyVO.setPolicy_url("dd");
		policyVO.setDistrict_lonitude("123");
		policyVO.setDistrict_latitude("234");
		
		model.addAttribute("policyVO", policyVO);
		
		return "policyMain";
	}
		
	@RequestMapping("/policy/count")
	public String policyCount(Model model) {
		
		//policyVO 리스트 넘겨주기
		//리스트 반환 (페이징 처리 x)
		PolicyVO policyVO = new PolicyVO();
		
		policyVO.setDistrict_num(1);
		policyVO.setDistrict_name("서울");
		policyVO.setPolicy_url("dd");
		policyVO.setDistrict_lonitude("123");
		policyVO.setDistrict_latitude("234");
		
		model.addAttribute("policyVO", policyVO);
		
		return "policyCount";
	}

	/* ---------- 관리자 페이지 - 진입 ----------*/
	@RequestMapping("/admin/policy")
	public String adminMain(PolicyVO policyVO,Model model) {
		
		
		//리스트 반환 (페이징 처리 x)
		policyVO.setDistrict_num(1);
		policyVO.setDistrict_name("서울");
		policyVO.setPolicy_url("dd");
		policyVO.setDistrict_lonitude("123");
		policyVO.setDistrict_latitude("234");
		
		model.addAttribute("policyVO", policyVO);
		
		return "adminPage";
	}
	
	@RequestMapping("/admin/performanceMain")
	public String adminCinemaMain(PolicyVO policyVO,Model model) {
		
		
		return "adminPerformanceMain";
	}
	
	/* ---------- 관리자 페이지 - 수정  ----------*/
	@GetMapping("/admin/policyModify")
	public String adminPolicyModifyForm(@RequestParam int district_num) {
		
		
		return "adminPolicyModify";
	}
	
	/* ---------- 관리자 페이지 - 수정  ----------*/
	@PostMapping("/admin/policyModify")
	public String adminPolicyModify(@Valid PolicyVO policyVO, BindingResult result) {
		
		
		return "adminPage";
	}
	
}
