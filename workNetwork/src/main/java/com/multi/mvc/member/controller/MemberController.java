package com.multi.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.multi.mvc.kakao.KaKaoService;
import com.multi.mvc.member.model.service.MemberService;
import com.multi.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j // log4j 선언을 대신 선언해주는 lombok 어노테이션
@SessionAttributes("loginMember") // loginMember를 Model 취급할 때 세션으로 처리하도록 도와주는 어노테이션
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private KaKaoService kakaoService;
	
//	@RequestMapping(name="/login", method = RequestMethod.POST)
	@PostMapping("/login")
	String login(Model model,String userId, String userPwd) {
		log.info("userId : " + userId + "pwd : " + userPwd);
		Member loginMember = service.login(userId, userPwd);

		if(loginMember != null) { // 성공
			model.addAttribute("loginMember", loginMember); // 세션에 저장되는 코드, @SessionAttributes
			return "redirect:/";
		} else { // 실패
			model.addAttribute("msg", "아이디, 패스워드가 일치하지 않습니다.");
			model.addAttribute("location", "/");
			return "/common/msg";
		}
		
	}
	
	
	
	
	
	
	
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(Model model, String code) {
		log.info("로그인 요청");
		if(code != null) {
			try {
				String loginUrl = "http://localhost/mvc/kakaoLogin";
				String token = kakaoService.getToken(code, loginUrl);
				Map<String, Object> map = kakaoService.getUserInfo(token);
				String kakaoToken = (String) map.get("id");
				Member loginMember = service.loginKaKao(kakaoToken);

				if(loginMember != null) { // 로그인 성공
					model.addAttribute("loginMember",loginMember); // 세션으로 저장되는 코드, 이유: @SessionAttributes
					return "redirect:/";
				}
			} catch (IOException e) {}
		}
		model.addAttribute("msg", "로그인에 실패하였습니다.");
		model.addAttribute("location","/");
		return "common/msg";
	}

	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) { // status : 세션의 상태와 세션 해제가 가능한 클래스
		log.info("status : " + status.isComplete());
		status.setComplete();
		log.info("status : " + status.isComplete());
		
		return "redirect:/";
	}

	
	
	// 회원가입
	@GetMapping("/common/header")
	public String enrollPage() {
		log.info("회원가입 페이지 요청");
		return "/common/header";
	}
	@GetMapping("/member/enroll/kakao")
	public String enrollKakao(Model model, String code) {
		log.info("가입 페이지 요청");
		if(code != null) {
			try {
				String enrollUrl = "http://localhost/mvc/member/enroll/kakao";
				System.out.println("code : " + code);
				String token = kakaoService.getToken(code, enrollUrl);
				System.out.println("token : " + token);
				Map<String, Object> map = kakaoService.getUserInfo(token);
				System.out.println(map);
				model.addAttribute("kakaoMap",map);
			} catch (IOException e) {}
		}
		return "member/enroll";
	}

	
	
	// ModelAndView 사용법 : 현업 일부와 전자정부프레임워크 표준.
	// 가능하면 프로젝트에서는 스타일 통일할 것!
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) { // @ModelAttribute 생략가능
		log.info("회원가입 member : " + member.toString());
		
		int result = service.save(member);
		
		if(result > 0) { // 성공
			model.addObject("msg", "회원가입에 성공하셨습니다.");
			model.addObject("location", "/");
		} else { // 실패
			model.addObject("msg", "회원가입에 실패하셨습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("/common/msg");
		
		return model;
		
	}
	
//	// memberinfo보기?
//	@RequestMapping("/member/info.do")
//	public String memberInfo() {
//		return "/member/info";
//	}
	
	
	// AJAX 회원가입 아이디 중복 검사
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String userId) {
		log.info("아이디 중복 확인 : " + userId);
		
		boolean result = service.validate(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
//    alert("아이디 중복 확인");
	
	@GetMapping("/member/info")
	public String memberInfo() {
		log.info("회원 정보 페이지 요청");
		return "/member/info";
	}
	
	@GetMapping("/member/favorites")
	public String favoritesPage() {
		log.info("즐겨찾기 페이지 요청");
		return "/member/favorites";
	}
	
	@GetMapping("/member/reviews")
	public String reviewsPage() {
		log.info("리뷰 페이지 요청");
		return "/member/reviews";
	}
	
	
	// 회원정보 수정
	@PostMapping("/member/update")
	public String update(Model model, 
			@ModelAttribute Member updateMember, // request에서 온 값
			@SessionAttribute(name = "loginMember", required = false) Member loginMember // 세션 값 가져오는 방법
	) {
		log.info("update 요청 updateMember : " + updateMember);
		if(loginMember == null || loginMember.getUserId().equals(updateMember.getUserId()) == false) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/");
			return "/common/msg";
		}
		
		updateMember.setMemberNo(loginMember.getMemberNo());
		int result = service.save(updateMember);
		
		if(result > 0) {
			model.addAttribute("loginMember", service.findById(loginMember.getUserId())); // DB에서 있는 데이터를 다시 가져와서 세션에 저장
			model.addAttribute("msg", "회원정보가 성공적으로 수정되었습니다.");
			model.addAttribute("location", "/member/info");
		} else {
			model.addAttribute("msg", "회원정보 수정에 실패하셨습니다.");
			model.addAttribute("location", "/member/info");
		}
		return "/common/msg";
	}
	
	
	
	// 비밀번호 변경
	@GetMapping("/member/security")
	public String updatePwdPage() {
		return "member/security";
	}
	
	@PostMapping("/member/security")
	public String updatePwd(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			String userPwd
	) {
		int result = service.updatePwd(loginMember, userPwd);
		
		if(result > 0) {
			model.addAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패하셨습니다");
		}
		model.addAttribute("script", "self.close()");
		return "/common/msg";
	}
	
	
	// 회원 탈퇴
//	http://127.0.0.1/mvc/member/delete
	@RequestMapping("/member/delete")
	public String delete(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		int result = service.delete(loginMember.getMemberNo());
		if(result > 0) {
			model.addAttribute("msg", "성공적으로 회원 탈퇴되었습니다.");
			model.addAttribute("location", "/logout");
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하셨습니다");
			model.addAttribute("location", "/member/info");
		}
		return "/common/msg";
	}
	
	
	
}
















