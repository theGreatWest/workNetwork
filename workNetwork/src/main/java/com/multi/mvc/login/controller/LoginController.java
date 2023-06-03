package com.multi.mvc.login.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.multi.mvc.login.model.service.LoginService;
import com.multi.mvc.login.model.vo.LoginMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.multi.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;


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
	
	@RequestMapping("/workNetwork/loginCheck")
	public String loginCheck(Model model, @RequestParam Map<String, String> param){
		Map<String, String> searchMap = new HashMap<String, String>();
		
		String id = "hufs2018";
		String password = "0000";
		List<LoginMember> member = service.login();
	
		if(member == null){
			System.out.println("로그인 실패");
			return "workNetwork/login";
		}
		else{
			System.out.println(member);
			return "index";
		}
	}
}
