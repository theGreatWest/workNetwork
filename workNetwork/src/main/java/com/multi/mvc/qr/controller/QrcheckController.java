package com.multi.mvc.qr.controller;

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
public class QrcheckController {
	// qrcheck : 초기화면
	@GetMapping("/workNetwork/qr_check")
	public String qr(Model model, @RequestParam Map<String, String> param) {

		return "workNetwork/qr_check";
	}
}
