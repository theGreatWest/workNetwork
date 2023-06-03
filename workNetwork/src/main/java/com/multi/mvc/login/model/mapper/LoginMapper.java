package com.multi.mvc.login.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.login.model.vo.*;

@Mapper
public interface LoginMapper{
    List<LoginMember> login(); // @Param : 파라메터임을 알리는 어노테이션. 없어 된다.
}
