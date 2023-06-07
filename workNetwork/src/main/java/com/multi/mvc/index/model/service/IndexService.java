package com.multi.mvc.index.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.index.model.mapper.IndexMapper;
import com.multi.mvc.index.model.vo.*;

@Service
public class IndexService {
	@Autowired
	private IndexMapper mapper;
	
	public List<News> select5News(){
		return mapper.select5News();
	}
	
	public List<Community> select5Community(){
		return mapper.select5Community();
	}
	
	public List<StatisticsChild> child(){
		return mapper.child();
	}
	
	public List<StatisticsScale> scale(){
		return mapper.scale();
	}
	
	public List<StatisticsAge> age(){
		return mapper.age();
	}

	public List<Faq> faq(){return mapper.faq();}

	public List<Week> week(Integer member_no){
		return mapper.week(member_no);
	}

	public List<Month> month(Integer member_no){
		return mapper.month(member_no);
	}

	public List<Year> year(Integer member_no){
		return mapper.year(member_no);
	}

	public List<SearchNews> sn(Map<String, String> searchMap){
		return mapper.searchNewsCount(searchMap);
	}
	
	public List<SearchNews> searchNews(PageInfo pageInfo, Map<String, String> searchMap){
		searchMap.put("limit", "" + pageInfo.getListLimit());
		searchMap.put("offset", "" + (pageInfo.getStartList() - 1));
		
		return mapper.searchNews(searchMap);
	}
	
	public List<SearchFaq> searchFaqs(PageInfo pageInfo, Map<String, String> searchMap){
		searchMap.put("limit", "" + pageInfo.getListLimit());
		searchMap.put("offset", "" + (pageInfo.getStartList() - 1));
		
		return mapper.searchFaq(searchMap);
	}

	public List<SearchFaq> fn(Map<String, String> searchMap){
		return mapper.searchFaqCount(searchMap);
	}
}
