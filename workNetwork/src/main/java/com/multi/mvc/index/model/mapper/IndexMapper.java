package com.multi.mvc.index.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.multi.mvc.index.model.vo.*;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IndexMapper {
	List<News> select5News();
	List<Community> select5Community();
	List<StatisticsChild> child();
	List<StatisticsScale> scale();
	List<StatisticsAge> age();
	List<Faq> faq();
	List<Week> week(@Param("member_no") Integer member_no);
	List<Month> month(@Param("member_no") Integer member_no);
	List<Year> year(@Param("member_no") Integer member_no);
	List<SearchNews> searchNews(Map<String, String> searchMap);
	List<SearchNews> searchNewsCount(Map<String, String> searchMap);
	List<SearchFaq> searchFaq(Map<String, String> searchMap);
	List<SearchFaq> searchFaqCount(Map<String, String> searchMap);
}
