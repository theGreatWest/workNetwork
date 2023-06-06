package com.multi.mvc.news.model.service;
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.news.model.mapper.NewsMapper;
import com.multi.mvc.news.model.vo.Articles;

@Service
public class NewsService {
	@Autowired
	private NewsMapper mapper;
	
	public List<Articles> searchArticles(PageInfo pageInfo, Map<String, String> searchMap){
		searchMap.put("limit", "" + pageInfo.getListLimit());
		searchMap.put("offset", "" + (pageInfo.getStartList() - 1));
		
		return mapper.searchArticles(searchMap);
	}
	
	public List<Articles> searchArticlesCount(Map<String, String> searchMap){
		return mapper.searchArticlesCount(searchMap);
	}
}
