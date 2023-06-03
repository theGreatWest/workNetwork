package com.multi.mvc; 

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.index.model.service.IndexService;
import com.multi.mvc.index.model.vo.Community;
import com.multi.mvc.index.model.vo.Faq;
import com.multi.mvc.index.model.vo.Month;
import com.multi.mvc.index.model.vo.News;
import com.multi.mvc.index.model.vo.SearchFaq;
import com.multi.mvc.index.model.vo.SearchNews;
import com.multi.mvc.index.model.vo.StatisticsAge;
import com.multi.mvc.index.model.vo.StatisticsChild;
import com.multi.mvc.index.model.vo.StatisticsScale;
import com.multi.mvc.index.model.vo.Week;
import com.multi.mvc.index.model.vo.Year;

@Controller
public class HomeController {
	@Autowired
	private IndexService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Locale locale, Model model, HttpSession session) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
// 뉴스 기사 모아보기 
		List<News> newsList = service.select5News();
		List<Integer> compSame = new ArrayList<Integer>();
		int cnt=0;
		int i=0;
		while(true) {
			if(cnt==5) {break;}
			int tmp = (int)(Math.random()*47);
			if(compSame.contains(tmp)){
				continue;
			}else {
				newsList.get(i++).setImg("resources/img/news/"+tmp+".png");
				compSame.add(tmp);
				cnt++;
			}
		}
		model.addAttribute("newsList", newsList);
		
// 커뮤니티 
		List<Community> communityList = service.select5Community();
		for(i=1;i<=5;i++) {
			communityList.get(i-1).setNum(i);
		}
		model.addAttribute("communityList",communityList);
// 통계자료: 출생아
		List<StatisticsChild> child = service.child();
		double[] m = new double[6];
		double[] w = new double[6];
		double[] total = new double[6];
		cnt=0;
		for(i=0;i<child.size();i++) {
			double tmp = child.get(i).getUseDate();
			if(child.get(i).getGender().equals("부")) {
				m[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(child.get(i).getGender().equals("모")) {
				w[cnt]=Math.round(tmp * 100.0) / 100.0;
				
				double tot = ((tmp+child.get(i-1).getUseDate())*13)/26;
				total[cnt++]=Math.round(tot * 100.0) / 100.0;
			}
		}
		model.addAttribute("m",Arrays.toString(m));
		model.addAttribute("w",Arrays.toString(w));
		model.addAttribute("total",Arrays.toString(total));
// 통계자료: 규모별
		List<StatisticsScale> scale = service.scale();
		double[] small = new double[5];
		double[] twentynine = new double[5];
		double[] thirty = new double[5];
		double[] threehundred = new double[5];
		double[] overthreehundred = new double[5];
		cnt=0;
		for(i=0;i<scale.size();i++) {
			double tmp = scale.get(i).getUseDate();
			if(scale.get(i).getWork_type().equals("5인미만")) {
				small[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(scale.get(i).getWork_type().equals("5~29인")) {
				twentynine[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(scale.get(i).getWork_type().equals("30~299인")) {
				thirty[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(scale.get(i).getWork_type().equals("300인미만")) {
				threehundred[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(scale.get(i).getWork_type().equals("300인이상")) {
				overthreehundred[cnt++]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		model.addAttribute("small",Arrays.toString(small));
		model.addAttribute("twentynine",Arrays.toString(twentynine));
		model.addAttribute("thirty",Arrays.toString(thirty));
		model.addAttribute("threehundred",Arrays.toString(threehundred));
		model.addAttribute("overthreehundred",Arrays.toString(overthreehundred));
// 통계자료: 나이대 
		List<StatisticsAge> age = service.age();
		double[] age20 = new double[5];
		double[] age30 = new double[5];
		double[] age40 = new double[5];
		double[] age50 = new double[5];
		double[] age60 = new double[5];
		double[] totalAge = new double[5];
		cnt=0;
		for(i=0;i<age.size();i++) {
			double tmp = age.get(i).getUseDate();
			if(age.get(i).getAge().equals("29세이하")) {
				age20[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(age.get(i).getAge().equals("30~39세")) {
				age30[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(age.get(i).getAge().equals("40~49세")) {
				age40[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(age.get(i).getAge().equals("50~59세")) {
				age50[cnt]=Math.round(tmp * 100.0) / 100.0;
			}else if(age.get(i).getAge().equals("60세이상")) {
				age60[cnt]=Math.round(tmp * 100.0) / 100.0;
				
				double tot = ((tmp+age.get(i-1).getUseDate()+age.get(i-2).getUseDate()+age.get(i-3).getUseDate()+age.get(i-4).getUseDate())*2)/10;
				totalAge[cnt++]=Math.round(tot * 100.0) / 100.0;
			}
		}
		model.addAttribute("ageTwo",Arrays.toString(age20));
		model.addAttribute("ageThree",Arrays.toString(age30));
		model.addAttribute("ageFour",Arrays.toString(age40));
		model.addAttribute("ageFive",Arrays.toString(age50));
		model.addAttribute("ageSix",Arrays.toString(age60));
		model.addAttribute("totalAge",Arrays.toString(totalAge));
// FAQ
		List<Faq> faq = service.faq();
		for(i=1;i<=5;i++) {
			faq.get(i-1).setNum(i);
		}
		model.addAttribute("faqList",faq);
		
// 마이페이지 : 주간 
		List<Week> week = service.week();
		double[] workHourWeek = new double[7];
		double weekTotalHour=0.0;
		double weekTotalOverHour=0.0;
		int resultOver;
		
		for(i=0;i<week.size();i++) {
			double tmp = week.get(i).getUseDate();
			weekTotalHour+=tmp;
			if(tmp>8.0) {weekTotalOverHour+=(tmp-8.0);}
			
			if(week.get(i).getWeek().equals("월")) {
				workHourWeek[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("화")) {
				workHourWeek[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("수")) {
				workHourWeek[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("목")) {
				workHourWeek[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("금")) {
				workHourWeek[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("토")) {
				workHourWeek[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("일")) {
				workHourWeek[6]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		if(weekTotalHour>52) {resultOver=1;}
		else {resultOver=0;}
		
		model.addAttribute("week",Arrays.toString(workHourWeek));
		model.addAttribute("resultOver",resultOver);
		model.addAttribute("weekTotalHour", Math.round(weekTotalHour/ 7.0 * 100.0) / 100.0);
		model.addAttribute("weekTotalOverHour", Math.round(weekTotalOverHour * 100.0) / 100.0);
		
// 마이페이지 : 월간
		List<Month> month = service.month();
		double[] workHourMonth = new double[12];
		double monthTotalHour=0.0;
		double monthTotalOverHour=0.0;
		
		for(i=0;i<month.size();i++) {
			double tmp = month.get(i).getUseDate();
			monthTotalHour+=tmp;
			if(tmp>8.0) {monthTotalOverHour+=(tmp-8.0);}
			
			if(month.get(i).getMonth().equals("1")) {
				workHourMonth[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("2")) {
				workHourMonth[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("3")) {
				workHourMonth[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("4")) {
				workHourMonth[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("5")) {
				workHourMonth[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("6")) {
				workHourMonth[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("7")) {
				workHourMonth[6]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("8")) {
				workHourMonth[7]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("9")) {
				workHourMonth[8]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("10")) {
				workHourMonth[9]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("11")) {
				workHourMonth[10]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("12")) {
				workHourMonth[11]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		model.addAttribute("month",Arrays.toString(workHourMonth));
		model.addAttribute("monthTotalHour", Math.round(monthTotalHour / 12.0 * 100.0) / 100.0);
		model.addAttribute("monthTotalOverHour", Math.round(monthTotalOverHour * 100.0) / 100.0);
		
// 마이페이지 : 연간
		List<Year> year = service.year();
		double[] workHourYear = new double[7];
		double yearTotalHour=0.0;
		double yearTotalOverHour=0.0;
		
		for(i=0;i<year.size();i++) {
			double tmp = year.get(i).getUseDate();
			yearTotalHour+=tmp;
			if(tmp>8.0) {yearTotalOverHour+=(tmp-8.0);}
			
			if(year.get(i).getYear().equals("2017")) {
				workHourYear[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2018")) {
				workHourYear[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2019")) {
				workHourYear[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2020")) {
				workHourYear[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2021")) {
				workHourYear[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2022")) {
				workHourYear[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2023")) {
				workHourYear[6]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		model.addAttribute("year",Arrays.toString(workHourYear));
		model.addAttribute("yearTotalHour", Math.round(yearTotalHour / 7.0 * 100.0) / 100.0);
		model.addAttribute("yearTotalOverHour", Math.round(yearTotalOverHour * 100.0) / 100.0);
		
		return "index";
	}
	
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
		
// 검색 : 뉴스기사
	@RequestMapping("/workNetwork/searchArticleForm")
	public String searchArticleForm(Model model, @RequestParam Map<String, String> param, String[] article_keyword) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String res="date1=&date2=&";
		
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
		int cnt_sql=service.sn(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		
		List<SearchNews> searchNews = service.searchNews(pageInfo, searchMap); // 조건에 맞추어 select
		
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
	
// 검색 : 뉴스기사 : 초기화면
	@RequestMapping("/workNetwork/searchArticle")
	public String searchArticle(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		// 페이지
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.sn(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		
		List<SearchNews> searchNews = service.searchNews(pageInfo, searchMap); // 조건에 맞추어 select
		
		List<Integer> compSame = new ArrayList<Integer>();
		int cnt=0;
		int i=0;
		while(true) {
			if(cnt==searchNews.size()) {break;}  // 결과 개수에 맞추어 
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
		
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchNews", searchNews);
		model.addAttribute("pageInfo", pageInfo); // 페이지
		
		return "workNetwork/search_article";
	}
	
// 검색 : FAQ
	@RequestMapping("/workNetwork/searchFaqForm")
	public String searchFaqForm(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String res="";
		if(!param.get("main").equals("")) {
			searchMap.put("main", param.get("main"));
			res+="main="+param.get("main")+"&";
		}else {
			searchMap.put("main_none","1");
			res+="main=&";
		}
		if(!param.get("middle").equals("")) {
			searchMap.put("middle", param.get("middle"));
			res+="middle="+param.get("middle")+"&";
		}else {
			searchMap.put("middle_none","1");
			res+="middle=&";
		}
		if(!param.get("title").equals("")) {
			searchMap.put("title", param.get("title"));
			res+="title="+param.get("title");
		}else {
			searchMap.put("title_none","1");
			res+="title=";
		}
		
		// 페이지
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.fn(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		System.out.println(searchMap);
		List<SearchFaq> searchFaqs = service.searchFaqs(pageInfo, searchMap); // 조건에 맞추어 select
		
		model.addAttribute("res",res);
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchFaqs", searchFaqs);
		model.addAttribute("pageInfo", pageInfo); // 페이지
		
		return "workNetwork/faq";
	}
	
// 검색 : FAQ : 초기화면
	@RequestMapping("/workNetwork/searchFaq")
	public String searchFaq(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("main_none","1");
		searchMap.put("middle_none","1");
		searchMap.put("title_none","1");
		
		// 페이지
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.fn(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		List<SearchFaq> searchFaqs = service.searchFaqs(pageInfo, searchMap); // 조건에 맞추어 select
		
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchFaqs", searchFaqs);
		model.addAttribute("pageInfo", pageInfo); // 페이지
			
		return "workNetwork/faq";
	}
	
// 검색 : FAQ - 상세페이지
	@RequestMapping("/workNetwork/searchFaqInfo")
	public String searchFaqInfo(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		String question = param.get("question");
		String answer = param.get("answer");
		String main = param.get("main");
		String middle = param.get("middle");
		
		model.addAttribute("question",question);
		model.addAttribute("answer", answer);
		model.addAttribute("main", main); 
		model.addAttribute("middle", middle); 
		
		return "workNetwork/faq_post";
	}
	
}