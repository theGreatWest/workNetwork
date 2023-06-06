package com.multi.mvc.login.model.service;

import com.multi.mvc.login.model.mapper.LoginMapper;
import com.multi.mvc.login.model.vo.LoginMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class LoginService {
    @Autowired
    private LoginMapper mapper;

    public LoginService(LoginMapper loginMapper) {
        this.mapper = loginMapper;
    }
    
    public boolean login(String email, String password, HttpServletRequest request){

        if (mapper.login(email,password)==null){
            return false;
        }
        else {
            LoginMember tempMapper = mapper.login(email,password);
            int member_no = tempMapper.getMember_no();
            String name = tempMapper.getName();

            request.getSession().setAttribute("member_no", member_no);
            request.getSession().setAttribute("name", name);
            return true;
        }
    }

}
