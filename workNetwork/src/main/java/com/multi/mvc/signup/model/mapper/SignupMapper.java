package com.multi.mvc.signup.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SignupMapper {
    void insertMember(@Param("member_no") int member_no, @Param("id") String id, @Param("password") String password, @Param("name") String name, @Param("email") String email, @Param("phone_number") String phoneNumber, @Param("sign_up_date") String sign_up_date);
    void insertMemberInfo(@Param("member_no") int member_no,@Param("company_name") String company_name,@Param("job") String job,@Param("age") int age, @Param("gender") String gender);
    Integer getMaxMemberNo();
}
