package com.multi.mvc.login.model.mapper;

import com.multi.mvc.login.model.vo.LoginMember;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper{
    LoginMember login(@Param("email") String email, @Param("password") String password); // @Param : 파라메터임을 알리는 어노테이션. 없어 된다.
}
