package com.multi.mvc.login.controller;

import com.multi.mvc.login.model.service.LoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@Slf4j
@Controller
public class LoginController {
	@Autowired
	private LoginService service;
// 로그인 : 초기화면

	@RequestMapping("/workNetwork/login")
	public String login(Model model, @RequestParam Map<String, String> param){
		return "workNetwork/login";
	}
	@RequestMapping("/")
	public String index(Model model, @RequestParam Map<String, String> param){
		return "index";
	}

	
	@RequestMapping("/workNetwork/loginCheck")
	public ModelAndView loginCheck(Model model, @RequestParam Map<String, String> param, HttpServletRequest request){

		ModelAndView mav = new ModelAndView();



		String email = param.get("email");
		String password = param.get("loginPassword");
		boolean loginResult = service.login(email, password, request);

		if(loginResult){
			log.info("로그인 성공");


			mav.setViewName("redirect:/");
		}
		else{
			log.info("로그인 실패");
			model.addAttribute("loginFailed", true); // Add the "loginFailed" attribute to the model
			mav.setViewName("redirect:/workNetwork/login");
		}
		return mav;
	}
	// 로그아웃
	@RequestMapping("/workNetwork/login/logout")
	public String logout(HttpServletRequest request) {
		// 세션에서 로그인 정보를 삭제
		request.getSession().removeAttribute("member_no");
		request.getSession().removeAttribute("name");

		// 로그인 페이지로 리디렉션
		return "redirect:/";
	}

	@GetMapping("/loginStatus")
	@ResponseBody
	public ResponseEntity<?> checkLoginStatus(HttpServletRequest request) {
		Integer memberNo = (Integer) request.getSession().getAttribute("member_no");
		boolean loginFailed = (memberNo == null);

		Map<String, Boolean> response = new HashMap<>();
		response.put("loginFailed", loginFailed);

		return ResponseEntity.ok(response);
	}
}
