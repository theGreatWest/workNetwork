package com.multi.mvc.signup.model.service;

import com.multi.mvc.login.model.mapper.LoginMapper;
import com.multi.mvc.signup.model.mapper.SignupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.Map;

@Service
public class SignupService {
    @Autowired
    private SignupMapper mapper;

    @Autowired
    private LoginMapper loginMapper;

    public SignupService(SignupMapper signupMapper){
        this.mapper = signupMapper;
    }

    public boolean insertMember(Map<String, String> param, HttpServletRequest request){

        String id = param.get("id");
        System.out.println("id is "+id);
        String password = param.get("loginPassword");
        System.out.println("password is "+password);
        String email = param.get("email");
        System.out.println("email is " + email);
        String name = param.get("name");
        System.out.println("name is " + name);
        String phoneNumber = param.get("phone");
        System.out.println("phone is " + phoneNumber);
        String company_name = param.get("company_name");
        System.out.println("company is "+company_name);
        String job = param.get("job");
        System.out.println("job is "+job);
        String gender = param.get("gender");
        System.out.println("gender is "+ gender);
        Integer age = Integer.valueOf(param.get("age"));
        System.out.println("age is " + age);
        int member_no = mapper.getMaxMemberNo()+1;
        System.out.println("new member_no is " + member_no);

        LocalDate currentDate = LocalDate.now();
        String formattedDate = currentDate.toString(); // Format: "yyyy-MM-dd"

        // Replace dashes with dots
        String sign_up_date = formattedDate.replace("-", ".");

        System.out.println("Current date is " + sign_up_date);


        if (loginMapper.login(id,password)==null){
            System.out.println("check");
            mapper.insertMember(member_no,id,password,name,email,phoneNumber,sign_up_date);
            mapper.insertMemberInfo(member_no,company_name,job,age,gender);
            return true;
        }
        else {
            return false;
        }
    }

}
