package com.multi.mvc.news.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.news.model.vo.Articles;

@Mapper
public interface NewsMapper {
	List<Articles> searchArticles(Map<String, String> searchMap);
	List<Articles> searchArticlesCount(Map<String, String> searchMap);
}
