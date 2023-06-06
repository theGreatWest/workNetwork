package com.multi.mvc.community.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.community.model.vo.CommunityList;
import com.multi.mvc.community.model.vo.Reply;

@Mapper
public interface CommunityMapper {
	List<CommunityList> communityList(Map<String, String> searchMap);
	List<CommunityList> searchList(Map<String, String> searchMap);
	List<CommunityList> communityListCount();
	List<CommunityList> searchListCount(Map<String, String> searchMap);
	int post(Map<String, String> searchMap);
	int update(Map<String, String> searchMap);
	List<CommunityList> replyCount(Map<String, String> searchMap);
	List<Reply> replyList(Map<String, String> searchMap);
	List<Reply> findMember(Map<String, String> searchMap);
	int reply(Map<String, String> searchMap);

}
