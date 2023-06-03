package com.multi.mvc.kakao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class KaKaoController {

	@RequestMapping("/kakaoMap1")
	String kakaoMap1(Model model) {
		List<MapInfo> mapList = new ArrayList<>();
		mapList.add(new MapInfo("카카오","제주시 어쩌구",33.450705,126.570677));
		mapList.add(new MapInfo("생태연못","제주시 어쩌구",33.450936,126.569477));
		mapList.add(new MapInfo("텃밭","제주시 어쩌구",33.450879,126.569940));
		mapList.add(new MapInfo("근린공원","제주시 어쩌구",33.451393,126.570738));
		
		// 중앙 좌표 x,y
		double x = 0.0;
		double y = 0.0;
		for(MapInfo map : mapList ) {
			x += map.getX();
			y += map.getY();
		}
		
		x = x / mapList.size();
		y = y / mapList.size();
		
		model.addAttribute("mapList",mapList);
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		return "/kakao/kakaoMap1"; 
	}
	
	@RequestMapping("/kakaoMap2")
	String kakaoMap2(Model model) {
		List<MapInfo> mapList = new ArrayList<>();
		mapList.add(new MapInfo("카카오","제주시 어쩌구",33.450705,126.570677));
		mapList.add(new MapInfo("생태연못","제주시 어쩌구",33.450936,126.569477));
		mapList.add(new MapInfo("텃밭","제주시 어쩌구",33.450879,126.569940));
		mapList.add(new MapInfo("근린공원","제주시 어쩌구",33.451393,126.570738));

		double x = 0.0;
		double y = 0.0;
		for(MapInfo map : mapList ) {
			x += map.getX();
			y += map.getY();
		}
		
		x = x / mapList.size();
		y = y / mapList.size();
		
		model.addAttribute("mapList",mapList);
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		return "/kakao/kakaoMap2"; 
	}
	
	
	@RequestMapping("/kakaoMap3")
	String kakaoMap3(Model model, String address) {
		model.addAttribute("address",address);
		return "/kakao/kakaoMap3"; 
	}
	
	@Autowired
    private KakaoPayService kakaopay;
	    
    @PostMapping("/kakaoPay")
    public String kakaoPay(@RequestParam Map<String, String> param, HttpSession session) {
        log.info("kakaoPay post............................................");
        session.setAttribute("param", param);
        return "redirect:" + kakaopay.kakaoPayReady(param);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        @SuppressWarnings("unchecked")
		Map<String, String> param = (Map<String, String>) session.getAttribute("param");
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, param));
        return "kakao/kakaoPaySuccess";
    }
	
	
	
}
