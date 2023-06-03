package com.multi.mvc.login.model.service;

import com.multi.mvc.login.model.mapper.LoginMapper;
import com.multi.mvc.login.model.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {
    @Autowired
    private LoginMapper mapper;
    
    public List<LoginMember> login(){
    	return mapper.login();
    }

}
