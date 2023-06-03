package com.multi.mvc.news.controller;

import java.time.LocalDate;
import java.util.ArrayList;
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
import com.multi.mvc.news.model.service.NewsService;
import com.multi.mvc.news.model.vo.Articles;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NewsController {
	@Autowired
	private NewsService service;
	
	public String changeValueNews(String v) {
		String real=null;
		if(v.equals("vsixnine")) {
			real= "69시간근무제";
		}else if(v.equals("vfee")) {
			real= "임금";
		}else if(v.equals("vhire")) {
			real= "해고";
		}
		return real;
	}

	@GetMapping("/workNetwork/newsForm")
	public String news(Model model, @RequestParam Map<String, String> param, String[] article_keyword) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String res="";
		
		if(!param.get("date1").equals("")) {
			String preDate=param.get("date1");
			String nextDate=param.get("date2");
			
			if(nextDate.equals("")) {
				nextDate=LocalDate.now().toString();
			}
			
			searchMap.put("preDate", preDate.replace("-", "."));
			searchMap.put("nextDate", nextDate.replace("-", "."));
			res+="date1="+preDate+"&date2="+nextDate+"&";
		}else {
			res+="date1=&date2=&";
		}
		
		if(article_keyword != null ) {
			searchMap.put("keyword", "1");
			for(int i=0;i<article_keyword.length;i++) {
				if(i==article_keyword.length-1) {searchMap.put("last", article_keyword[i]);}
				searchMap.put(article_keyword[i], changeValueNews(article_keyword[i].toString()));
				res+="article_keyword="+article_keyword[i]+"&";
			}
		}
		
		if(!param.get("article_title").equals("")) {
			searchMap.put("v", param.get("article_title"));
			res+="article_title="+param.get("article_title");
		}else {
			res+="article_title=";
		}
		
		// 페이지
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.searchArticlesCount(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		
		List<Articles> searchNews = service.searchArticles(pageInfo, searchMap); // 조건에 맞추어 select
		
		List<Integer> compSame = new ArrayList<Integer>();
		int cnt=0;
		int i=0;
		while(true) {
			if(cnt==searchNews.size()) {break;}  // 결과에 맞추어 
			int tmp = (int)(Math.random()*47);
			if(compSame.contains(tmp)){
				if(compSame.size()==48) {compSame.clear();}
				continue;
			}else {
				searchNews.get(i++).setImg("resources/img/news/"+tmp+".png");
				compSame.add(tmp);
				cnt++;
			}
		}
		
		model.addAttribute("res",res);
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchNews", searchNews);
		model.addAttribute("pageInfo", pageInfo); // 페이지

		return "workNetwork/search_article";
	}
}
