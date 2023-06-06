package com.multi.mvc.signup.controller;

import com.multi.mvc.signup.model.service.SignupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Slf4j
@Controller
public class SignupController {


	// 회원가입 : 초기화면

	@Autowired
	private SignupService service;
	@GetMapping("/workNetwork/signup")
	public String signup(Model model, @RequestParam Map<String, String> param) {

		return "workNetwork/signup";
	}

	@RequestMapping("/workNetwork/signup/insert")
	public ModelAndView insertMember(Model model, @RequestParam Map<String, String> param, HttpServletRequest request, RedirectAttributes redirectAttributes){

		ModelAndView mav = new ModelAndView();


		boolean signupResult = service.insertMember(param,request);

		if(signupResult){
			log.info("회원가입 성공");
			mav.setViewName("redirect:/");
		}
		else{
			log.info("회원가입 실패");
			mav.setViewName("redirect:/workNetwork/signup");
		}
		return mav;
	}

}