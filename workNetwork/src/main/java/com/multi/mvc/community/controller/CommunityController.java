package com.multi.mvc.community.controller;

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
import com.multi.mvc.community.model.service.CommunityService;
import com.multi.mvc.community.model.vo.CommunityList;
import com.multi.mvc.community.model.vo.Reply;
import com.multi.mvc.news.model.vo.Articles;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	// 커뮤니티 : 리스트
	@GetMapping("/workNetwork/community")
	public String postList(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.communityListCount().size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		List<CommunityList> searchPost = service.communityList(pageInfo, searchMap);
		
		model.addAttribute("res","communityDepartment=&communityTitle=&");
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchPost", searchPost);
		model.addAttribute("pageInfo", pageInfo); // 페이지
		
		return "workNetwork/community";
	}
	
	// 커뮤니티 : 검색 
	@GetMapping("/workNetwork/communityForm")
	public String postSearchList(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String res="";
		
		try {
			if(!param.get("community_department").equals("")) {
				searchMap.put("communityDepartment", param.get("community_department"));
				res+="communityDepartment="+param.get("community_department")+"&";
			}
		} catch (Exception e) {
			res+="communityDepartment=&";
		}
		try {
			if(!param.get("community_title").equals("")) {
				searchMap.put("communityTitle", param.get("community_title"));
				res+="communityTitle="+param.get("community_title")+"&";
			}
		} catch (Exception e) {
			res+="communityTitle=&";
		}
		
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.searchListCount(searchMap).size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		List<CommunityList> searchPost = service.searchList(pageInfo, searchMap);
		
		model.addAttribute("res",res);
		model.addAttribute("count",searchPost.size());
		model.addAttribute("searchPost", searchPost);
		model.addAttribute("pageInfo", pageInfo); // 페이지
		
		return "workNetwork/community";
	}
	
	// 커뮤니티 : 글 쓰기 페이지로 이동 
	@GetMapping("/workNetwork/write")
	public String write(Model model, @RequestParam Map<String, String> param) {
		return "workNetwork/write_blog";
	}
	// 커뮤니티 : 글 쓰기
	@RequestMapping("/workNetwork/writesuccess")
	public String write2(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		String create_date = LocalDate.now().toString();
		String month = create_date.split("-")[1]+"월 ";
		String day = create_date.split("-")[2]+"일";
		create_date=month+day;
		
		String status = "공개";
		
		String original_filename="None";
		String renameed_filename="None";
		
		String views = "0";
		
		String member_no = "1"; // 진욱님께서 수정해주셔야 할 부분
		// 직종 처리하는 부분도 수정해주세요(param.get("department);)
		
		searchMap.put("create_date", create_date);
		searchMap.put("status", status);
		searchMap.put("original_filename", original_filename);
		searchMap.put("renameed_filename", renameed_filename);
		searchMap.put("views", views);
		searchMap.put("member_no", member_no);
		searchMap.put("title", param.get("title"));
		searchMap.put("content", param.get("content"));
		
		service.post(searchMap);
		
		searchMap = new HashMap<String, String>();
		
		int page=1;
		try {
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		int cnt_sql=service.communityListCount().size();
		
		PageInfo pageInfo = new PageInfo(page, 5, cnt_sql, 12);
		
		List<CommunityList> searchPost = service.communityList(pageInfo, searchMap);
		
		model.addAttribute("res","");
		model.addAttribute("count",cnt_sql);
		model.addAttribute("searchPost", searchPost);
		model.addAttribute("pageInfo", pageInfo); // 페이지
		
		return "workNetwork/community";
	}
	
	// 커뮤니티 : 글 보기
	@GetMapping("/workNetwork/show")
	public String show(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		model.addAttribute("title",param.get("title"));
		model.addAttribute("content",param.get("content"));
		model.addAttribute("name",param.get("name"));
		model.addAttribute("create_date",param.get("create_date"));
		model.addAttribute("board_no",param.get("board_no"));
		
//		조회수 나타내고 update 
		String views = Integer.toString(Integer.parseInt(param.get("views"))+1);
		model.addAttribute("views",views);
		searchMap.put("views", views);
		searchMap.put("board_no", param.get("board_no"));
		service.update(searchMap);
		
//		댓글 수
		String replyCount = Integer.toString(service.replyCount(searchMap).get(0).getCount());
		model.addAttribute("replyCount",replyCount);
		
//		댓글 나타내기
		List<Reply> reply = service.replyList(searchMap);
		for(Reply r : reply) {
			String[] tmp = r.getCreate_date().split("-");
			r.setCreate_date(tmp[0]+"년 "+tmp[1]+"월 "+tmp[2]+"일");
		}
		model.addAttribute("res","");
		model.addAttribute("reply",reply);
		
		return "workNetwork/post";
	}
	
// 커뮤니티 : 댓글 쓰기
	@RequestMapping("/workNetwork/replyForm")
	public String replyForm(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		model.addAttribute("title",param.get("title"));
		model.addAttribute("content",param.get("content"));
		model.addAttribute("name",param.get("name"));
		model.addAttribute("create_date",param.get("create_date"));
		model.addAttribute("board_no",param.get("board_no"));
		model.addAttribute("department",param.get("department"));
		model.addAttribute("views",param.get("views"));

//		회원번호 찾기
		String member_no = "2"; 		// 로그인 된 회원의 번호를 가져올 수 있도록 수정해주세요
		
//		댓글 입력
		searchMap.put("board_no", param.get("board_no"));
		searchMap.put("member_no", member_no);
		searchMap.put("reply", param.get("reply_content"));
		searchMap.put("create_date", LocalDate.now().toString());
		service.reply(searchMap);
		
//		댓글 수
		searchMap.put("board_no", param.get("board_no"));
		String replyCount = Integer.toString(service.replyCount(searchMap).get(0).getCount());
		model.addAttribute("replyCount",replyCount);
		
//		댓글 나타내기
		List<Reply> reply = service.replyList(searchMap);
		for(Reply r : reply) {
			String[] tmp = r.getCreate_date().split("-");
			r.setCreate_date(tmp[0]+"년 "+tmp[1]+"월 "+tmp[2]+"일");
		}
		model.addAttribute("res","");
		model.addAttribute("reply",reply);
		
		return "workNetwork/post";
	}
}
