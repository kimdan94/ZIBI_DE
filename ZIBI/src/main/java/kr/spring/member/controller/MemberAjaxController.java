package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberAjaxController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	JavaMailSenderImpl mailSender;
	
	//이메일 인증
	@PostMapping("/member/emailAuth")
	@ResponseBody
	public Map<String, Integer> emailAuth(@RequestParam String mem_email) {
		log.info("<<이메일 인증 - 사용자 입력 이메일>> : " + mem_email);
		
		Map<String, Integer> mapJson = new HashMap<String, Integer>();
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111; 
		
		//이메일 보낼 양식
		String setFrom = "229rkawk@gmail.com";
		String toMail = mem_email;
		String title = "ZIBI 회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다.<br>해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
            
            mapJson.put("code", checkNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapJson;
	}
	
	//카카오 로그인/회원 가입
	@RequestMapping("/member/loginKakao")
	@ResponseBody
	public Map<String,String> loginKakao(@RequestParam String mem_email, HttpSession session) {
		
		Map<String, String> mapJson = new HashMap<String, String>();
		MemberVO db_member = memberService.checkEmail(mem_email);
		
		if(db_member==null) { //회원가입 이력 없음 > 회원가입 + 로그인
			int mem_num = memberService.createMemNum();
			MemberVO memberVO = new MemberVO();
			
			memberVO.setMem_num(mem_num);
			memberVO.setMem_email(mem_email);
			memberVO.setMem_social(1); 
			memberVO.setMem_nickname("카카오"+mem_num);
			
			memberService.registerMember(memberVO); //회원가입
			session.setAttribute("user",memberVO); //로그인 처리
			
			mapJson.put("result","success");
			
			log.debug("<<카카오 회원가입>>"+memberVO);
		} else { //회원가입 되어있음 > 로그인
			session.setAttribute("user",db_member);
			mapJson.put("result","success");
		}
		
		return mapJson;
	}
	
	/*----------프로필 사진 업로드----------*/
	@RequestMapping("/member/updateMyPhoto")
	@ResponseBody
	public Map<String,String> updateMyPhoto(HttpSession session, MemberVO memberVO){
		
		Map<String, String> mapJson = new HashMap<String, String>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			mapJson.put("result","logout");
		} else {
			memberVO.setMem_num(user.getMem_num());
			memberService.updateProfileImages(memberVO);
			mapJson.put("result","success");
		}
		return mapJson;
	}
	
	/*----------이메일 중복 체크 : 회원 가입----------*/
	@RequestMapping("/member/checkEmail")
	@ResponseBody
	public Map<String,String> checkEmail(@RequestParam String mem_email, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		MemberVO memberVO = memberService.checkEmail(mem_email); //이메일 중복 여부를 변수에 저장
		
		if(memberVO!=null) { //이메일이 중복인 경우
			map.put("result", "emailDuplicated");
		} else {
			if(!Pattern.matches("^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$",mem_email)) { //이메일 미중복, 패턴 불일치
				map.put("result", "notMatchPattern");
			} else { //이메일 미중복, 패턴 일치
				map.put("result", "emailNotFound");
			}
		}
		return map;
	}
	
	/*----------닉네임 중복 체크 : 회원 가입----------*/
	@RequestMapping("/member/registerNickname")
	@ResponseBody
	public Map<String,String> registerNickname(@RequestParam String mem_nickname){
		
		Map<String, String> map = new HashMap<String, String>();
		MemberVO memberVO = memberService.checkNickname(mem_nickname); //닉네임 유무 체크
		
		if(memberVO!=null) { //닉네임 중복
			map.put("result", "nicknameDuplicated");
		} else { //닉네임 미중복
			if(!Pattern.matches("^[가-힣]*$",mem_nickname)) { //형식 불일치
				map.put("result", "notMatchPattern");
			} else { //패턴 일치
				map.put("result", "nicknameNotFound");
			}
		}
		return map;
	}
	
	/*----------닉네임 중복 체크 : 마이페이지----------*/
	@RequestMapping("/member/checkNickname")
	@ResponseBody
	public Map<String,String> checkNickname(@RequestParam String mem_nickname, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인된 사용자 정보를 읽어 옴
		MemberVO memberVO = memberService.checkNickname(mem_nickname); //닉네임 유무 체크
		
		if(user==null) { //세션 만료 시
			map.put("result", "logout");
		} else if(mem_nickname.equals(user.getMem_nickname())) { //원래 닉네임 사용 가능
			map.put("result", "originalNickName");
		} else if(memberVO!=null) { //닉네임 중복
			map.put("result", "nicknameDuplicated");
		} else { //닉네임 미중복
			if(!Pattern.matches("^[가-힣]*$",mem_nickname)) { //형식 불일치
				map.put("result", "notMatchPattern");
			} else { //패턴 일치
				map.put("result", "nicknameNotFound");
			}
		}
		return map;
	}
	
	/*----------연락처 중복 체크 : 마이페이지----------*/
	@RequestMapping("/member/checkPhone")
	@ResponseBody
	public Map<String,String> checkPhone(@RequestParam String mem_phone, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user"); //로그인된 사용자 정보를 읽어 옴
		MemberVO memberVO = memberService.checkPhone(mem_phone); //파라미터로 받은 연락처 체크
		
		if(user==null) { //로그아웃
			map.put("result", "logout");
		} else if(mem_phone.equals(user.getMem_phone())) { //원래 연락처는 사용 가능
			map.put("result", "originalPhone");
		} else if(memberVO!=null) { //연락처 중복
			map.put("result", "phoneDuplicated");
		} else { //연락처 미중복
			if(!Pattern.matches("^010-([0-9]{3,4})-([0-9]{4})$",mem_phone)) { //형식 불일치
				map.put("result", "notMatchPattern");
			} else { //연락처 미중복
				map.put("result", "phoneNotFound");
			}
		}
		return map;
	}
	
}
