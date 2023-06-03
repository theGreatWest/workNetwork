package com.multi.mvc.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.community.model.mapper.CommunityMapper;
import com.multi.mvc.community.model.vo.CommunityList;
import com.multi.mvc.community.model.vo.Reply;

@Service
public class CommunityService {
	@Autowired
	private CommunityMapper mapper;
	
	public List<CommunityList> communityList(PageInfo pageInfo, Map<String, String> searchMap){
		searchMap.put("limit", "" + pageInfo.getListLimit());
		searchMap.put("offset", "" + (pageInfo.getStartList() - 1));
		
		return mapper.communityList(searchMap);
	}
	
	public List<CommunityList> searchList(PageInfo pageInfo, Map<String, String> searchMap){
		searchMap.put("limit", "" + pageInfo.getListLimit());
		searchMap.put("offset", "" + (pageInfo.getStartList() - 1));
		
		return mapper.searchList(searchMap);
	}
	
	public List<CommunityList> communityListCount(){
		return mapper.communityListCount();
	}
	
	public List<CommunityList> searchListCount(Map<String, String> searchMap){
		return mapper.searchListCount(searchMap);
	}
	
	public int post(Map<String, String> searchMap) {
		return mapper.post(searchMap);
	}
	
	public int update(Map<String, String> searchMap) {
		return mapper.update(searchMap);
	}
	
	public List<CommunityList> replyCount(Map<String, String> searchMap) {
		return mapper.replyCount(searchMap);
	}
	
	public List<Reply> replyList(Map<String, String> searchMap) {
		return mapper.replyList(searchMap);
	}
	
	public List<Reply> findMember(Map<String, String> searchMap) {
		return mapper.findMember(searchMap);
	}
	
	public int reply(Map<String, String> searchMap) {
		return mapper.reply(searchMap);
	}
}
