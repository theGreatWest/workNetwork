package com.multi.mvc.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqController {
	// faq : 초기화면
	@GetMapping("/workNetwork/faq")
	public String faq(Model model, @RequestParam Map<String, String> param) {

		return "workNetwork/faq";
	}
	
	// faq_post : 초기화면
	@GetMapping("/workNetwork/faq_post")
	public String faqPost(Model model, @RequestParam Map<String, String> param) {
		
		return "workNetwork/faq_post";
	}
}
